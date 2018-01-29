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
    Shop.all.each do |shop|
      10.times do
        Drink.create(name: FFaker::Name.first_name,
          price: rand(5..12)*5,
          shop: shop
        )
      end
    end
    puts "create 10 drinks for each shop"
  end

end
