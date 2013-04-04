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

    unless items['head'].blank?
      equips<<Equipment.new(equip_part: 'head', equip_name: items["head"]["name"], equip_icon: items["head"]["icon"], equip_quality: items["head"]["quality"], equip_itemlvl: items["head"]["itemLevel"], equip_stat: items["head"]["stats"])
    end

    unless items['neck'].blank?
      equips<<Equipment.new(equip_part: 'neck', equip_name: items["neck"]["name"], equip_icon: items["neck"]["icon"], equip_quality: items["neck"]["quality"], equip_itemlvl: items["neck"]["itemLevel"], equip_stat: items["neck"]["stats"])
    end

    unless items['shoulder'].blank?
      equips<<Equipment.new(equip_part: 'shoulder', equip_name: items["shoulder"]["name"], equip_icon: items["neck"]["icon"], equip_quality: items["neck"]["quality"], equip_itemlvl: items["neck"]["itemLevel"], equip_stat: items["neck"]["stats"])
    end

    unless items['back'].blank?
      equips<<Equipment.new(equip_part: 'back', equip_name: items["back"]["name"], equip_icon: items["back"]["icon"], equip_quality: items["back"]["quality"], equip_itemlvl: items["back"]["itemLevel"], equip_stat: items["back"]["stats"])
    end

    unless items['chest'].blank?
      equips<<Equipment.new(equip_part: 'chest', equip_name: items["chest"]["name"], equip_icon: items["chest"]["icon"], equip_quality: items["chest"]["quality"], equip_itemlvl: items["chest"]["itemLevel"], equip_stat: items["chest"]["stats"])
    end

    unless items['wrist'].blank?
      equips<<Equipment.new(equip_part: 'wrist', equip_name: items["wrist"]["name"], equip_icon: items["wrist"]["icon"], equip_quality: items["wrist"]["quality"], equip_itemlvl: items["wrist"]["itemLevel"], equip_stat: items["wrist"]["stats"])
    end

    unless items['hands'].blank?
      equips<<Equipment.new(equip_part: 'hands', equip_name: items["hands"]["name"], equip_icon: items["hands"]["icon"], equip_quality: items["hands"]["quality"], equip_itemlvl: items["hands"]["itemLevel"], equip_stat: items["hands"]["stats"])
    end

    unless items['waist'].blank?
      equips<<Equipment.new(equip_part: 'waist', equip_name: items["waist"]["name"], equip_icon: items["waist"]["icon"], equip_quality: items["waist"]["quality"], equip_itemlvl: items["waist"]["itemLevel"], equip_stat: items["waist"]["stats"])
    end

    unless items['legs'].blank?
      equips<<Equipment.new(equip_part: 'legs', equip_name: items["legs"]["name"], equip_icon: items["legs"]["icon"], equip_quality: items["legs"]["quality"], equip_itemlvl: items["legs"]["itemLevel"], equip_stat: items["legs"]["stats"])
    end

    unless items['feet'].blank?
      equips<<Equipment.new(equip_part: 'feet', equip_name: items["feet"]["name"], equip_icon: items["feet"]["icon"], equip_quality: items["feet"]["quality"], equip_itemlvl: items["feet"]["itemLevel"], equip_stat: items["feet"]["stats"])
    end

    unless items['finger1'].blank?
      equips<<Equipment.new(equip_part: 'finger1', equip_name: items["finger1"]["name"], equip_icon: items["finger1"]["icon"], equip_quality: items["finger1"]["quality"], equip_itemlvl: items["finger1"]["itemLevel"], equip_stat: items["finger1"]["stats"])
    end

    unless items['finger2'].blank?
      equips<<Equipment.new(equip_part: 'finger2', equip_name: items["finger2"]["name"], equip_icon: items["finger2"]["icon"], equip_quality: items["finger2"]["quality"], equip_itemlvl: items["finger2"]["itemLevel"], equip_stat: items["finger2"]["stats"])
    end

    unless items['trinket1'].blank?
      equips<<Equipment.new(equip_part: 'trinket1', equip_name: items["trinket1"]["name"], equip_icon: items["trinket1"]["icon"], equip_quality: items["trinket1"]["quality"], equip_itemlvl: items["trinket1"]["itemLevel"], equip_stat: items["trinket1"]["stats"])
    end

    unless items['trinket2'].blank?
      equips<<Equipment.new(equip_part: 'trinket2', equip_name: items["trinket2"]["name"], equip_icon: items["trinket2"]["icon"], equip_quality: items["trinket2"]["quality"], equip_itemlvl: items["trinket2"]["itemLevel"], equip_stat: items["trinket2"]["stats"])
    end

    unless items['mainHand'].blank?
      equips<<Equipment.new(equip_part: 'mainHand', equip_name: items["mainHand"]["name"], equip_icon: items["mainHand"]["icon"], equip_quality: items["mainHand"]["quality"], equip_itemlvl: items["mainHand"]["itemLevel"], equip_stat: items["mainHand"]["stats"])
    end

    unless items['offHand'].blank?
      equips<<Equipment.new(equip_part: 'offHand', equip_name: items["offHand"]["name"], equip_icon: items["offHand"]["icon"], equip_quality: items["offHand"]["quality"], equip_itemlvl: items["offHand"]["itemLevel"], equip_stat: items["offHand"]["stats"])
    end

    @character.equipments<<equips
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

