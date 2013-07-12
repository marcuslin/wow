# encoding: UTF-8
class UsersController < ApplicationController
  load_and_authorize_resource


  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      @pop_equip = {}

      char_class = {
        '1' => 'Warrior',
        '2' => 'Paladin',
        '3' => 'Hunter',
        '4' => 'Rogue',
        '5' => 'Priest',
        '6' => 'Death Knight',
        '7' => 'Shaman',
        '8' => 'Mage',
        '9' => 'Warlock',
        '10' => 'Monk',
        '11' => 'Druid'
      }.each do |k,v|

        equip_part = %w(head neck shoulder back chest wrist hands
                      waist legs feet finger1 finger2 trinket1
                      trinket2 mainHand offHand)
        char = Character.where(character_class: k)

        equip = {}
        equip_part.each do |p|
          equip[p] = Equipment.where(equip_class: k, equip_part: p).order("equip_counts DESC").first

            unless equip[p].blank?
              equip[p]['ratio'] = Float(equip[p].equip_counts) / Float(char.count) * 100
            end
        #binding.pry
        end
        @pop_equip[v] = equip

      end
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

      @char_class = {
        '1' => 'Warrior',
        '2' => 'Paladin',
        '3' => 'Hunter',
        '4' => 'Rogue',
        '5' => 'Priest',
        '6' => 'Death Knight',
        '7' => 'Shaman',
        '8' => 'Mage',
        '9' => 'Warlock',
        '10' => 'Monk',
        '11' => 'Druid'
      }

      @char_race = {
        '1' => 'human',
        '2' => 'orc',
        '3' => 'dwarf',
        '4' => 'night elf',
        '5' => 'undead',
        '6' => 'tauren',
        '7' => 'gnome',
        '8' => 'troll',
        '9' => 'goblin',
        '10' => 'blood elf',
        '11' => 'draenei',
        '22' => 'worgen',
        '24' => 'pandaren'
      }

    #binding.pry
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    #binding.pry
  end

  def update
    # @user = User.find(params[:id])

    user_input = params[:user]



    profile = Character.get_profile(user_input["realms"], user_input["characters"])

    # make sure user ids are unique in the table before we save it
    current_user.update_attributes(user_name: user_input[:user_name])

    @character = Character.where(id: current_user.id, name: user_input["characters"]).first_or_create! do |c|
      c.character_class = profile["class"]
      c.race            = profile["race"]
      c.gender          = profile["gender"]
      c.level           = profile["level"]
      c.thumbnail       = profile["thumbnail"]
      c.realm           = user_input["realms"]
    end

    #realm = Realm.where(user_id: current_user.id, character_id: @character.id, name: profile["realm"]).first_or_create!

    items = profile["items"]
    #save character and equipment info

    equips = []
    items.keys.each do |k|

      next if k == "averageItemLevel" || k == "averageItemLevelEquipped"

      unless items[k].blank?
        equip = Equipment.where(equip_name: items[k]["name"]).first_or_create do |e|
          e.equip_part = k
          e.equip_icon = items[k]["icon"]
          e.equip_quality = items[k]["quality"]
          e.equip_itemlvl = items[k]["itemLevel"]
          e.equip_num = items[k]["id"]
          e.equip_class = profile["class"]
          equipStat = Equipment.get_data(items[k]["id"])
          e.equip_stat = equipStat["bonusStats"].to_json
          # e.gem0_num = items[k]["tooltipParams"]["gem0"]
          # e.gem1_num = items[k]["tooltipParams"]["gem1"]
        end
      end
      # get equipment stats back to db

      # binding.pry

      unless items[k]["tooltipParams"]["gem0"].blank?
        gems_0 = Jewel.get_gemdata(items[k]["tooltipParams"]["gem0"])
        gems_data0 = Jewel.where(gem_name: gems_0["name"]).first_or_create do |g|
          g.gem_icon = gems_0["icon"]
          g.gem_num = gems_0["id"]
          g.gem_data = gems_0["gemInfo"]["bonus"]
          g.gem_type = gems_0["gemInfo"]["type"]["type"]
        end
        equip.jewels << gems_data0
        equip.save
        # EquipGem.where(gem_id: gems_data0.id, equipment_id: equip.id).first_or_create
      end

      unless items[k]["tooltipParams"]["gem1"].blank?
        gems_1 = Jewel.get_gemdata(items[k]["tooltipParams"]["gem1"])
        gems_data1 = Jewel.where(gem_name: gems_1["name"]).first_or_create do |g|
          g.gem_icon = gems_1["icon"]
          g.gem_num = gems_1["id"]
          g.gem_data = gems_1["gemInfo"]["bonus"]
          g.gem_type = gems_1["gemInfo"]["type"]["type"]
        end
        equip.jewels << gems_data1
        equip.save
        # EquipGem.where(gem_id: gems_data1.id, equipment_id: equip.id).first_or_create
      end
      # get gem data back to db, and saving data to equip_gems(bridge table)

        # equip = Equipment.new
        #   equip_part: k,
        #   equip_name: items[k]["name"],
        #   equip_icon: items[k]["icon"],
        #   equip_quality: items[k]["quality"],
        #   equip_itemlvl: items[k]["itemLevel"],
        #   equip_stat: items[k]["stats"],
        #   equip_num: items[k]["id"])

      CharacterEquip.where(character_id: current_user.id, equipment_id: equip.id).first_or_create
      # saving data to character_equips(bridge table)
    end

    # @character.equipments << equips
    # @character.save

    respond_to do |format|
      if current_user.save
        format.html { redirect_to current_user, notice: 'User was successfully created.' }
        format.json { render json: current_user, status: :created, location: current_user }
      else
        format.html { render action: "new" }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    # character.realm = "#{response['realm']}"
    # binding.pry
    end
  end
  # PUT /users/1
  # PUT /users/1.json

    # respond_to do |format|
    #  if @user.update_attributes(params[:user])
    #    format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def new_character
    #@user = current_user
  end
end

