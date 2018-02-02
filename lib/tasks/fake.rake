namespace :fake do
  desc "clean all and recreate fake shops data"
  task shop: :environment do
    Shop.destroy_all
    10.times do
      Shop.create(name: FFaker::Name.first_name,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        menu: Rails.root.join("public/350x350.png").open
      )
    end
    puts "create 10 shops"
  end

  desc "clean all and recreate fake drinks data"
  task drink: :environment do
    Drink.destroy_all
    drinks = ['茉莉綠茶', '阿薩姆紅茶', '四季春茶', '黃金烏龍', '檸檬綠茶', '梅果綠',
      '蜂蜜綠', '桔子綠', '8冰綠', '養樂多綠', '冰淇淋紅茶', '鮮柚綠', '檸檬汁',
      '金桔檸檬', '檸檬梅子', '檸檬養樂多', '8冰茶', '鮮柚汁', '葡萄柚多多', '奶茶',
      '奶綠', '紅茶瑪奇朵', '黃金烏龍奶茶', '四季奶青', '阿華田', '可可芭蕾',
      '波霸紅', '波霸綠', '波霸青', '波霸烏', '波霸奶茶(大顆)', '波霸奶綠(大顆)',
      '珍珠紅', '珍珠綠', '珍珠青', '珍珠烏', '珍珠奶茶(小顆)', '珍珠奶綠(小顆)',
      '椰果奶茶', '仙草奶凍', '檸檬汁', '金桔檸檬', '檸檬梅子', '檸檬養樂多', '8冰茶',
      '鮮柚汁(季節限定)', '葡萄柚多多', '紅茶拿鐵', '綠茶拿鐵', '黃金烏龍拿鐵',
      '阿華田拿鐵', '可可芭蕾拿鐵']
    option = {糖: ['正常糖', '半糖'], 冰:['正常冰', '去冰', '熱']}
    json_option = JSON.dump(option)
    Shop.all.each do |shop|
      drinks.each do |drink|
        price = rand(7..12)*5
        Drink.create(name: "#{drink}(大)",
          price: price,
          shop: shop,
          option: json_option
        )
        Drink.create(name: "#{drink}(小)",
          price: price - 10,
          shop: shop,
          option: json_option
        )
      end
    end
    puts "create drinks for each shop"
  end

end
