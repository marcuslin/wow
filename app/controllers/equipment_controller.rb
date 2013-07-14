class EquipmentController < ApplicationController
  def show
    equipment = params

    @equip = Equipment.find(equipment['id'])

    new_equip_stat = []

    stat_info = []

    @equip[:new_equip_stat] = new_equip_stat

    char = Character.where(character_class: @equip.equip_class)

    equip_stat = JSON.parse(@equip.equip_stat)

    # replace equip_num with it own stat info
    equip_stat.each do |b|
      equip_stat_info = BonusStat.where(stats_num: b["stat"]).first.stats_info
      test = b["stat"]
      if b["stat"] == 1 || b["stat"] == 2 || b["stat"] == 3 || b["stat"] == 4 || b["stat"] == 5 || b["stat"] == 6 || b["stat"] == 7 || b["stat"] == 57 || b["stat"] == 35
        stat_info = "+ #{b['amount']}" + " #{equip_stat_info}"
      elsif b["stat"] == 46
        stat_info = "Equip: Restores " + " #{b['amount']}" + " health per 5 sec"
      elsif b["stat"] == 40
        stat_info = "Equip: Increases attack power by " + " #{b['amount']}" + "(in Cat, Bear, Dire Bear, and Moonkin forms only)"
      elsif b["stat"] == 43
        stat_info = "Equip: Restores " + "#{b['amount']}" + "mana per 5 sec"
      else
        stat_info = "#{equip_stat_info}" + " #{b['amount']}"
      end
      new_equip_stat << stat_info
      # binding.pry
    end

    @equip_calc = Float(@equip.equip_counts) / Float(char.count) * 100
    # count and calculate specific class equip percentage

    jewel = @equip.jewels.map(&:id).group_by{|x| x}
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
      format.json { render json: @equip }
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

    char = Character.where(character_class: klasspart['klass'])
    @equip_pop = Equipment.where(equip_class: klasspart['klass'], equip_part: klasspart['part'])

    @equip_pop.each do |e|
      e.percentage = Float(e.equip_counts) / Float(char.length) * 100
    end
  end
end
