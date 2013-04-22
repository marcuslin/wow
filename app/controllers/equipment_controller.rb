class EquipmentController < ApplicationController
  def show
    equipment = params

    @equips = Equipment.where(id: equipment['id'])[0]

    char = Character.where(character_class: @equips.equip_class)

    @equip_calc = Float(@equips.equip_counts) / Float(char.count) * 100
    # count and calculate specific class equip percentage

    jewel = @equips.jewels.map(&:id).group_by{|x| x}
    # get jewel info form same equip and group by jewel id
    @jewel_calc = {}
    # assign @jewel_calc as empty hash

    jewel.keys.each do |k|
      jewel_name = Jewel.where(id: k)[0].gem_name

      @jewel_calc[jewel_name] = {}
      @jewel_calc[jewel_name][:owns_by] = {}
      @jewel_calc[jewel_name][:ratio] = {}

      @jewel_calc[jewel_name][:owns_by] = jewel[k].length
      @jewel_calc[jewel_name][:ratio] = Float(jewel[k].length) / Float(char.count) * 100
    end
    # count and calculate gems ratio for specific equip

    # binding.pry

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
