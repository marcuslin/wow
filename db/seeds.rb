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

realms = %w(尖石 日落沼澤 冰霜之刺 冰風崗哨 世界之樹 狂熱之刃 水晶之刺 米奈希爾 巨龍之喉 地獄吼)
chars = %w(Monpp 牧師小暖 Kitsmonk 毛皮皮 Fion 冰小琳 牛牛小德暖 Acedog 大雄偷看中 神塵
 punkin Vyaenie Huung 小燕 Zogxx 小喵咩 矮子小飛子 憤怒的魯路修 牙龍天勢 Afamau
 魍魂 小飛子 Hellaslol 焦急模式 大逆罪人 Alician 綾崎颯 羞恥妻 溫室效應 Akedog 風清奴
 來去無痕 Militant 亡靈塞特 Rewind Aaronj Pheromone Xoxooxo Oomnilol 米恩斯 孤斬 猛枒
 乂皇權天授乂 Intense Guillaume 知還 末世兇殺 紫雲聖者 鐵老 馮虛禦風 Ttcooper 紫裝人
 白小爺五世 知炎 Somad 部落戰神 阿哩公威啊 紅落券輕霜 藏拙 黯命 疾犽 殘小罪 Seamo 祈待
 阿哩公威阿 血境矇月 神一般的霸气 神一般的帥氣 Iceshock 娜娜莉口人口 Cdada 快樂老頭子
 Spectrez 維妮維妮 龍墓花園 快伴啪 Avarive 小補帖 Futura 熊貓是部落的 Hnchbhsd 妖星魔鬼流
 阿城哥 三支煙 玉鷺 莫冥 老拖 Thanatosah Derocco 川野狂 川野畜 咒文 川野明 戀小薰 朋友派我來的
 乂薰 緋夜神命 Blackbeard Voodooist Sundaily)

# add new users
users = []
chars.each do |c|
  puts "Checking and inserting #{c}"
  user =  User.where(user_name: c, email: "#{c}@test.test").first_or_create do |u|
    u.password = 'testtest'
    u.password_confirmation = 'testtest'
  end
  users << user
end

# add new chars
realms.each do |r|
  users.each do |u|
    begin
      puts "Inserting #{u.user_name} ..."
      profile = Character.get_profile(r, u.user_name)

      character = Character.where(user_id: u.id, name: u.user_name).first_or_create! do |c|
        c.character_class = profile["class"]
        c.race            = profile["race"]
        c.gender          = profile["gender"]
        c.level           = profile["level"]
      end

      Realm.where(user_id: u.id, character_id: character.id, name: r).first_or_create!

      items = profile["items"]

      equips = []
      items.keys.each do |k|

        next if k == "averageItemLevel" || k == "averageItemLevelEquipped"

        unless items[k].blank?
          equip = Equipment.where(equip_name: items[k]["name"]).first_or_create do |e|
            e.equip_part = k
            e.equip_icon = items[k]["icon"]
            e.equip_quality = items[k]["quality"]
            e.equip_itemlvl = items[k]["itemLevel"]
            e.equip_num = items[k]["id"]
            e.equip_class = profile["class"]
            stat = items[k]["stats"]
            e.equip_stat = stat.to_json

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
      puts "Finish inserting #{u.user_name} ..."
      puts 'sleep for 3 seconds to cotinues the next character'
      sleep 3
    rescue Exception => e
      puts "Something went wrong when fetching / inserting equipment for #{u.user_name}\n\n"
      puts "#{e}"
    end
  end
end
