class EquipmentController < ApplicationController
  def show
    equipment = params

    @equips = Equipment.where(id: equipment['id'])[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
