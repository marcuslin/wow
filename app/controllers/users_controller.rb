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
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

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
    end

    realm = Realm.where(user_id: current_user.id, character_id: @character.id, name: profile["realm"]).first_or_create!

    items = profile["items"]
    #save character and equipment info

    equips = []

    items.keys.each do |k|

      next if k == "averageItemLevel" || k == "averageItemLevelEquipped"

      unless items[k].blank?
        equip = Equipment.new(
          equip_part: k,
          equip_name: items[k]["name"],
          equip_icon: items[k]["icon"],
          equip_quality: items[k]["quality"],
          equip_itemlvl: items[k]["itemLevel"],
          equip_stat: items[k]["stats"],
          equip_num: items[k]["id"])
      end

      equips << equip if equip.valid?
    end

    # equips_to_add = []
    # equips.each do |e|
    #   equip = Character.equipments.build(e)
    #   equips_to_add << equip if equip.valid?
    # end

    @character.equipments << equips
    @character.save

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

