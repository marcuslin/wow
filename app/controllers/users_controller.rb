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
    @user = User.where(user_name: user_input[:user_name]).first_or_create

    @character = Character.where(id: @user.id, name: user_input["character_ids"]).first_or_create! do |c|
      c.character_class = profile["class"]
      c.race            = profile["race"]
      c.gender          = profile["gender"]
      c.level           = profile["level"]
    end

    realm = Realm.where(user_id: @user.id, character_id: @character.id, name: profile["realm"]).first_or_create!

    items = profile["items"]

    # you will need to do db changes
    # 1. You don't need to manually create an equipment_id field. Rails takes care of that for you.
    #    Rmove that column
    # 2. You need a character_id column in the equipment talbe. you can do this : t.references :character
    char = @character.equipments.build(character_id: @character.id, head: items["head"]["name"], neck: items["neck"]["name"], shoulder: items["shoulder"]["name"], back: items["back"]["name"], chest: items["chest"]["name"], wrist: items["wrist"]["name"], hands: items["hands"]["name"], waist: items["waist"]["name"], legs: items["legs"]["name"], feet: items["feet"]["name"], finger_1: items["finger1"]["name"], finger_2: items["finger2"]["name"], trinket_1: items["trinket1"]["name"], trinket_2: items["trinket2"]["name"], main_hand: items["mainHand"]["name"], off_hand: items["offHand"]["name"])

      # add other equipments like the above
    end

    # binding.pry
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

