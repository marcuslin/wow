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

  def popequip
    klasspart = params

    @char_class = {
        '1' => 'Warrior',
        '2' => 'Paladin',
        '3' => 'Hunter',
        '4' => 'Rogue',
        '5' => 'Priest',
        '6' => 'Death Knight',
        '7' => 'Shaman',
        '8' => 'Mage',
        '9' => 'Warlock',
        '10' => 'Monk',
        '11' => 'Druid'
    }

    @part_calc = []

    char = Character.where(character_class: klasspart['klass'])
    @equip_pop = Equipment.where(equip_class: klasspart['klass'], equip_part: klasspart['part'])

    @equip_pop.each do |e|
      partcalc = Float(e.equip_counts) / Float(char.length) * 100
      @part_calc << partcalc
      #binding.pry
    end

  end
end
