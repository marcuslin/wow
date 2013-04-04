class EquipmentController < ApplicationController
  def show
    @equipment = Equipment.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
