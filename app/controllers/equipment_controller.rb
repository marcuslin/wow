# encoding: UTF-8
class EquipmentController < ApplicationController
  def show
    @equips = Equipment.find(params['id'])
    char = Character.where(character_class: @equips.equip_class)

    # binding.pry
    # @equip_calc = Float(@equip.equip_counts) / Float(char.count) * 100
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

    @equipRatio = {}
    @otherEquip = Equipment.where(equip_class: @equips.equip_class, equip_part: @equips.equip_part).each do |o|
      equipName = o.equip_name
      @equipRatio[equipName] = Float(o.equip_counts) / Float(char.length) * 100

    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equip }
    end
  end

  def popequip
    klasspart = params

    @char_class = {
        '1' => '戰士',
        '2' => '聖騎士',
        '3' => '獵人',
        '4' => '盜賊',
        '5' => '牧師',
        '6' => '死亡騎士',
        '7' => '薩滿',
        '8' => '法師',
        '9' => '術士',
        '10' => '武僧',
        '11' => '德魯伊'
    }


    @choosenklass = @char_class[klasspart['klass']]
    @char = Character.where(character_class: klasspart['klass'])
    @equip_pop = Equipment.where(equip_class: klasspart['klass'], equip_part: klasspart['part'])

    @equip_pop.each do |e|
      e.percentage = Float(e.equip_counts) / Float(@char.length) * 100
    end
  end
end
