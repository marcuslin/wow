# encoding: UTF-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index

    @pop_equip = {}

    # If chosen class exist, get the chosen class equip info, else, get random class equip info.
    show_klass = ''
    show_klass = params['klass'] || rand(1..11)

    # getting equip stats num and info filtering by chosen class and part.
    equip_ratios = []
    equip = {}

    Equipment::PART_MAP.each do |p, pc|

      equip_obj = Equipment.by_class_and_part(show_klass, p)
      next if equip_obj.blank?

      # parse stats num and info into JSON .
      equip[p] = equip_obj
      equip_stat = JSON.parse(equip_obj.equip_stat)
      next if equip_stat.blank?

      # replace equip_num with it own stat info, and assign it to specific part.
      new_equip_stat = []
      equip_stat.each do |b|
        stats_details = b["stat"]
        equip_stat_info = BonusStat.by_stats_num(stats_details)

        stat_info = ''
        if [1, 2, 3, 4, 5, 6, 7, 57, 35].include?(stats_details)
          stat_info = "+ #{b['amount']}" + " #{equip_stat_info}"
        elsif stats_details == 46
          stat_info = "Equip: Restores " + "#{b['amount']}" + " health per 5 sec"
        elsif stats_details == 40
          stat_info = "Equip: Increases attack power by " + "#{b['amount']}" + "(in Cat, Bear, Dire Bear, and Moonkin forms only)"
        elsif stats_details == 43
          stat_info = "Equip: Restores " + "#{b['amount']}" + " mana per 5 sec"
        else
          stat_info = "#{equip_stat_info}" + " #{b['amount']}"
        end
      new_equip_stat << stat_info
      end
      logger.info "\n\n\n#{new_equip_stat}\n\n\n"
      equip[p][:new_equip_stat] = new_equip_stat
      # transfer stats info into html for view, by adding <br> for each stat, and assign it to specific part.
      new_stats_html = []
      new_equip_stat.each do |s|
        new_stats_html << "<br>" + s
      end
      logger.info "\n\n\n#{new_stats_html}\n\n\n"
      equip[p][:new_stats_html] = new_stats_html

      # calculating most popular equipment ratio for chosen class.
      @char = Character.by_class(show_klass)
      equip_rate = EquipmentController.count_ratio(equip_obj.equip_counts, @char.count)
      equip_ratios << equip_rate
      # save ratio for each part
      equip_ratios.each do |er|
        equip[p][:ratios] = er
      end
    end

    logger.info "\n\n\n#{equip[p]}\n\n\n"
    @pop_equip[Character::CLASS_MAP[show_klass]] = equip
    end

  def show
    @user = User.find(params[:id])

    # count how many characters are there that has the same class with current user's character.
    user_char = Character.by_user_id(@user.id)
    char_count = Character.count_by_user_char_klass(user_char[0].character_class)

    @user_char_equip = []
    part = Equipment::PART_MAP.each do |p, pc|
      @pre_pop_equip = Equipment.by_class_and_part(user_char[0].character_class, p)
    end
    @user_char_equip << @pre_pop_equip

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update

    user_input = params[:user]
    # getting characters info back from api, by using realms and character name tha user put.
    profile = Character.get_profile(user_input["realms"], user_input["characters"])

    # saving character info do db, gave each character it's user id.
    @character = Character.by_user_id_char_name(current_user.id, user_input["characters"]) do |c|
      c.character_class = profile["class"]
      c.race = profile["race"]
      c.gender = profile["gender"]
      c.level = profile["level"]
      c.thumbnail = profile["thumbnail"]
      c.realm = user_input["realms"]
    end
    # get item info that this character's using.
    items = profile["items"]

     equips = []
    items.keys.each do |k|

      # skip average item level and average item level equipped.
      next if k == "averageItemLevel" || k == "averageItemLevelEquipped"

      #save equipment info to db.
      unless items[k].blank?
        equip = Equipment.create_by_equip_name(items[k]["name"]) do |e|
          e.equip_part = k
          e.equip_icon = items[k]["icon"]
          e.equip_quality = items[k]["quality"]
          e.equip_itemlvl = items[k]["itemLevel"]
          e.equip_num = items[k]["id"]
          e.equip_class = profile["class"]
          equip_stats = Equipment.get_data(items[k]["id"])
          e.equip_stat = equip_stats["bonusStats"].to_json
        end
      end

      # get gems info back to db if it exist.
      unless items[k]["tooltipParams"]["gem0"].blank?
        gems_0 = Jewel.get_gem_data(items[k]["tooltipParams"]["gem0"])
        gems_data0 = Jewel.by_jewel_name(gems_0["name"]) do |g|
          g.gem_icon = gems_0["icon"]
          g.gem_num = gems_0["id"]
          g.gem_data = gems_0["gemInfo"]["bonus"]
          g.gem_type = gems_0["gemInfo"]["type"]["type"]
        end
        equip.jewels << gems_data0
        equip.save
      end

      unless items[k]["tooltipParams"]["gem1"].blank?
        gems_1 = Jewel.get_gem_data(items[k]["tooltipParams"]["gem1"])
        gems_data1 = Jewel.by_jewel_name(gems_1["name"]) do |g|
          g.gem_icon = gems_1["icon"]
          g.gem_num = gems_1["id"]
          g.gem_data = gems_1["gemInfo"]["bonus"]
          g.gem_type = gems_1["gemInfo"]["type"]["type"]
        end
        equip.jewels << gems_data1
        equip.save
      end

      # saving data to character_equips(bridge table).
      CharacterEquip.by_user_id_equip_id(current_user.id, equip.id)
    end

    respond_to do |format|
      if current_user.save
        format.html { redirect_to users_details_user_path, notice: 'User was successfully created.' }
        format.json { render json: current_user, status: :created, location: current_user }
      else
        format.html { render action: "new" }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def new_character
  end

  def usersDetails
    @charList = Character.by_user_id(current_user.id)[0]
  end
end