class EquipmentController < ApplicationController
  def show
    equipment = params

    @equips = Equipment.where(id: equipment['id'])[0]

    # count and calculate specific class equip percentage

    char_count = Character.where(character_class: @equips.equip_class).count

    @equip_calc = Float(@equips.equip_counts) / Float(char_count) * 100
    # binding.pry

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
