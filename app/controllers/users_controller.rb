class UsersController < ApplicationController
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
    user_input = params[:user]

    profile = Character.get_profile(user_input["realm_ids"], user_input["character_ids"])

    # make sure user ids are unique in the table before we save it
    @user = rUser.whee(user_name: user_input[:user_name]).first_or_create

    @character = Character.where(id: @user.id, name: user_input["character_ids"]).first_or_create! do |c|
      c.character_class = profile["class"]
      c.race            = profile["race"]
      c.gender          = profile["gender"]
      c.level           = profile["level"]
    end

    realm = Realm.where(user_id: @user.id, character_id: @character.id, name: profile["realm"]).first_or_create!

    items = profile["items"]

    #save character and equipment info

    equipment = @character.equipments.build(character_id: @character.id, head: items["head"]["name"], head_icon: items["head"]["icon"], head_quality: items["head"]["quality"], head_itemlvl: items["head"]["itemLevel"], head_stat: items["head"]["stats"], neck: items["neck"]["name"], neck_icon: items["neck"]["icon"], neck_quality: items["neck"]["quality"], neck_itemlvl: items["neck"]["itemLevel"], neck_stat: items["neck"]["stats"], shoulder: items["shoulder"]["name"], shoulder_icon: items["shoulder"]["icon"], shoulder_quality: items["shoulder"]["quality"], shoulder_itemlvl: items["shoulder"]["itemLevel"], shoulder_stat: items["shoulder"]["stats"], back: items["back"]["name"], back_icon: items["back"]["icon"], back_quality: items["back"]["quality"], back_itemlvl: items["back"]["itemLevel"],back_stat: items["back"]["stats"], chest: items["chest"]["name"], chest_icon: items["chest"]["icon"], chest_quality: items["chest"]["quality"], chest_itemlvl: items["chest"]["itemLevel"],chest_stat: items["chest"]["stats"], wrist: items["wrist"]["name"], wrist_icon: items["wrist"]["icon"], wrist_quality: items["wrist"]["quality"], wrist_itemlvl: items["wrist"]["itemLevel"],wrist_stat: items["wrist"]["stats"], hands: items["hands"]["name"], hands_icon: items["hands"]["icon"], hands_quality: items["hands"]["quality"], hands_itemlvl: items["hands"]["itemLevel"], hands_stat: items["hands"]["stats"], waist: items["waist"]["name"], waist_icon: items["waist"]["icon"], waist_quality: items["waist"]["quality"], waist_itemlvl: items["waist"]["itemLevel"], waist_stat: items["waist"]["stats"], legs: items["legs"]["name"], legs_icon: items["legs"]["icon"], legs_quality: items["legs"]["quality"], legs_itemlvl: items["legs"]["itemLevel"], legs_stat: items["legs"]["stats"], feet: items["feet"]["name"], feet_icon: items["feet"]["icon"], feet_quality: items["feet"]["quality"], feet_itemlvl: items["feet"]["itemLevel"], feet_stat: items["feet"]["stats"], finger_1: items["finger1"]["name"], finger_1_icon: items["finger1"]["icon"], finger_1_quality: items["finger1"]["quality"], finger_1_itemlvl: items["finger1"]["itemLevel"], finger_1_stat: items["finger1"]["stats"], finger_2: items["finger2"]["name"], finger_2_icon: items["finger2"]["icon"], finger_2_quality: items["finger2"]["quality"], finger_2_itemlvl: items["finger2"]["itemLevel"], finger_2_stat: items["finger2"]["stats"], trinket_1: items["trinket1"]["name"], trinket_1_icon: items["trinket1"]["icon"], trinket_1_quality: items["trinket1"]["quality"], trinket_1_itemlvl: items["trinket1"]["itemLevel"], trinket_1_stat: items["trinket1"]["stats"], trinket_2: items["trinket2"]["name"], trinket_2_icon: items["trinket2"]["icon"], trinket_2_quality: items["trinket2"]["quality"], trinket_2_itemlvl: items["trinket2"]["itemLevel"], trinket_2_stat: items["trinket2"]["stats"], main_hand: items["mainHand"]["name"], main_hand_icon: items["mainHand"]["icon"], main_hand_quality: items["mainHand"]["quality"], main_hand_itemlvl: items["mainHand"]["itemLevel"], main_hand_stat: items["mainHand"]["stats"], off_hand: items["offHand"]["name"], off_hand_icon: items["offHand"]["icon"], off_hand_quality: items["offHand"]["quality"], off_hand_itemlvl: items["offHand"]["itemLevel"], off_hand_stat: items["offHand"]["stats"])

    binding.pry

    @character.equipments << equipment
    @character.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # character.realm = "#{response['realm']}"
    # binding.pry
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

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
end

