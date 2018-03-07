# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'yaml'

Shop.destroy_all
Drink.destroy_all

shops = YAML.load_file('db/data.txt')
shops.each do |shop|
  s = Shop.create(name: shop[:name],
    tel: shop[:tel],
    address: shop[:address],
    menu: shop[:menu],
    custom: false
  )
  shop[:drinks].each do |drink, price|
    Drink.create(name: drink,
      price: price,
      shop: s
    )
  end
end
puts "create seed data"
