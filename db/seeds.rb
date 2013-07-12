# encoding: UTF-8
admin = User.create(user_name: 'test' ,email: 'test@test.test', password: 'testtest', password_confirmation: 'testtest')
admin.toggle!(:admin)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = {
  "尖石" => %w(Monpp 牧師小暖 Kitsmonk 毛皮皮 Fion 冰小琳 牛牛小德暖 Acedog 大雄偷看中 神塵 punkin Vyaenie Huung 小燕 Zogxx 小喵咩 矮子小飛子 憤怒的魯路修 牙龍天勢 Afamau 魍魂 小飛子 Hellaslol 焦急模式 大逆罪人 Alician 綾崎颯 羞恥妻 溫室效應 Akedog),
  "日落沼澤" => %w(風清奴 來去無痕 Militant 亡靈塞特 Rewind Aaronj Pheromone Xoxooxo Oomnilol 米恩斯 孤斬 猛枒 乂皇權天授乂 Intense Guillaume 知還 末世兇殺 紫雲聖者 鐵老 馮虛禦風 Ttcooper),
  "冰霜之刺" => %w(紫裝人 白小爺五世 知炎 Somad 部落戰神 阿哩公威啊 紅落券輕霜 藏拙 黯命 疾犽 殘小罪 Seamo 祈待 阿哩公威阿 血境矇月 神一般的霸气 神一般的帥氣 Iceshock),
  "冰風崗哨" => %w(娜娜莉口人口 Cdada 快樂老頭子),
  "世界之樹" => %w(Spectrez 維妮維妮 龍墓花園),
  "狂熱之刃" => %w(快伴啪 Avarive 小補帖 Futura 熊貓是部落的 Hnchbhsd 妖星魔鬼流),
  "水晶之刺" => %w(阿城哥 三支煙 玉鷺 莫冥 老拖 Thanatosah),
  "巨龍之喉" => %w(川野狂 川野畜 咒文 川野明),
  "地獄吼" => %w(戀小薰 朋友派我來的 乂薰 緋夜神命 Blackbeard Voodooist Sundaily)
}

stats = {
  "1" => "Health",
  "2" => "Mana",
  "3" => "Agility",
  "4" => "Strength",
  "5" => "Intellect",
  "6" => "Spirit",
  "7" => "Stamina",
  "46" => "Equip: Restores health per 5 sec",
  "44" => "Equip: Increases your armor penetration rating by",
  "38" => "Equip: Increases attack power by",
  "15" => "Equip: Increases your shield block rating by",
  "48" => "Equip: Increases the block value of your shield by",
  "19" => "Equip: Improves melee critical strike rating by",
  "20" => "Equip: Improves ranged critical strike rating by",
  "32" => "Equip: Increases your critical strike rating by",
  "21" => "Equip: Improves spell critical strike rating by",
  "25" => "Equip: Improves melee critical avoidance rating by",
  "26" => "Equip: Improves ranged critical avoidance rating by",
  "34" => "Equip: Improves critical avoidance rating by",
  "27" => "Equip: Improves spell critical avoidance rating by",
  "12" => "Equip: Increases defense rating by",
  "13" => "Equip: Increases your dodge rating by",
  "37" => "Equip: Increases your expertise rating by",
  "40" => "Equip: Increases attack power by in Cat, Bear, Dire Bear, and Moonkin forms only",
  "28" => "Equip: Improves melee haste rating by",
  "29" => "Equip: Improves ranged haste rating by",
  "36" => "Equip: Increases your haste rating by",
  "30" => "Equip: Improves spell haste rating by",
  "16" => "Equip: Improves melee hit rating by",
  "17" => "Equip: Improves ranged hit rating by",
  "31" => "Equip: Increases your hit rating by",
  "18" => "Equip: Improves spell hit rating by",
  "22" => "Equip: Improves melee hit avoidance rating by",
  "23" => "Equip: Improves ranged hit avoidance rating by",
  "33" => "Equip: Improves hit avoidance rating by",
  "24" => "Equip: Improves spell hit avoidance rating by",
  "43" => "Equip: Restores mana per 5 sec",
  "49" => "Equip: Increases your mastery rating by",
  "14" => "Equip: Increases your parry rating by",
  "39" => "Equip: Increases ranged attack power by",
  "35" => "pvp resilience",
  "41" => "Equip: Increases damage done by magical spells and effects by up to",
  "42" => "Equip: Increases healing done by magical spells and effects by up to",
  "47" => "Equip: Increases spell penetration by",
  "45" => "Equip: Increases spell power by",
  "57" => "pvp power"
}

# add new users
users = []
data.each do |k, chars|
  chars.each do |c|
    puts "Checking and inserting #{k}, #{c}"

    user = User.create(user_name: c, email: "#{c}@test.test") do |u|
      u.password = 'testtest'
      u.password_confirmation = 'testtest'
    end
  users << user
  end
end

# add new chars
data.each do |r, chars|
  chars.each do |ch|
    begin
      puts "Inserting #{ch} ..."
      profile = Character.get_profile(r, ch)

      user = User.where(user_name: ch)

      character = Character.where(user_id: user[0].id, name: ch).first_or_create! do |c|
        c.character_class = profile["class"]
        c.race            = profile["race"]
        c.gender          = profile["gender"]
        c.level           = profile["level"]
        c.thumbnail       = profile["thumbnail"]
        c.realm           = r
      end

      items = profile["items"]

      equips = []
      items.keys.each do |k|

        next if k == "averageItemLevel" || k == "averageItemLevelEquipped"

        unless items[k].blank?
          equip = Equipment.where(equip_name: items[k]["name"], equip_class: profile["class"]).first_or_create do |e|
            e.equip_part = k
            e.equip_icon = items[k]["icon"]
            e.equip_quality = items[k]["quality"]
            e.equip_itemlvl = items[k]["itemLevel"]
            e.equip_num = items[k]["id"]
            e.equip_class = profile["class"]
            equipStat = Equipment.get_data(items[k]["id"])
            e.equip_stat = equipStat["bonusStats"].to_json

          end
        end


        unless items[k]["tooltipParams"]["gem0"].blank?
          gems_0 = Jewel.get_gemdata(items[k]["tooltipParams"]["gem0"])
          gems_data0 = Jewel.where(gem_name: gems_0["name"]).first_or_create do |g|
            g.gem_icon = gems_0["icon"]
            g.gem_num = gems_0["id"]
            g.gem_data = gems_0["gemInfo"]["bonus"]
            g.gem_type = gems_0["gemInfo"]["type"]["type"]
          end
          equip.jewels << gems_data0
          equip.save
        end

        unless items[k]["tooltipParams"]["gem1"].blank?
          gems_1 = Jewel.get_gemdata(items[k]["tooltipParams"]["gem1"])
          gems_data1 = Jewel.where(gem_name: gems_1["name"]).first_or_create do |g|
            g.gem_icon = gems_1["icon"]
            g.gem_num = gems_1["id"]
            g.gem_data = gems_1["gemInfo"]["bonus"]
            g.gem_type = gems_1["gemInfo"]["type"]["type"]
          end
          equip.jewels << gems_data1
          equip.save
        end
        CharacterEquip.where(character_id: character.id, equipment_id: equip.id).first_or_create
      end
      puts "Finish inserting #{ch} ..."
      puts 'sleep for 3 seconds to cotinues the next character'
      sleep 3
    rescue Exception => e
      puts "Something went wrong when fetching / inserting equipment for #{ch}\n\n"
      puts "#{e}"
    end
  end
end

#add stats data
  stats.each do |s, stat|
    puts "Inserting stat num #{s} ..."
      @statdata = BonusStat.create(stats_num: s, stats_info: stat)
    puts "Finish inserting stat. "
    puts 'sleep for 3 seconds to cotinues the next stat'
    sleep 3
  end
