# encoding: UTF-8
class EquipmentController < ApplicationController
  def show
    @equips = Equipment.find(params['id'])
    char = Character.by_class(@equips.equip_class)

    # get jewel info form same equip and group by jewel id
    jewel = @equips.jewels.map(&:id).group_by{|x| x}
    @jewel_calc = {}

    # count and calculate gems ratio for specific equip
    jewel.keys.each do |k|
      jewel_name = Jewel.get_name_by_id(k)[0].gem_name

      @jewel_calc[jewel_name] = {}
      @jewel_calc[jewel_name][:owns_by] = {}
      @jewel_calc[jewel_name][:ratio] = {}

      @jewel_calc[jewel_name][:owns_by] = jewel[k].length
      @jewel_calc[jewel_name][:ratio] = Equipment.count_ratio(jewel[k].length, char.count)
    end

    # count and calculate specific class equip percentage
    @equip_ratio = {}
    @otherEquip = Equipment.search_by_class_and_part(@equips.equip_class, @equips.equip_part).each do |o|
      equipName = o.equip_name
      @equip_ratio[equipName] = Equipment.count_ratio(o.equip_counts, char.length)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equip }
    end
  end

  def pop_equip
    # count popular equipment usage rate for specific class
    @choosenklass = Character::CLASS_MAP[params['klass']]
    @char = Character.by_class(params['klass'])
    @equip_pop = Equipment.search_by_class_and_part(params['klass'], params['part'])
    @equip_pop.each do |e|
      e.percentage = Equipment.count_ratio(e.equip_counts, @char.length)
    end
  end
end
