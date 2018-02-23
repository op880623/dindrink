class Order < ApplicationRecord
  include Hashid::Rails
  has_many :entries, dependent: :destroy
  belongs_to :shop

  def conclusion
    drinks = {}
    self.entries.includes(:drink).each do |entry|
      drinks[entry.drink.name] ||= {}
      drinks[entry.drink.name]["#{entry.ice}-#{entry.sugar}"] ||= 0
      drinks[entry.drink.name]["#{entry.ice}-#{entry.sugar}"] += entry.quantity
    end
    text = ""
    quantity_total = 0
    drinks.each do |drink, options|
      options.each do |option, quantity|
        text += "<h3>#{quantity}杯#{option}的#{drink}</h3>"
        quantity_total += quantity
      end
    end
    text += "<h3>總共#{quantity_total}杯飲料</h3>"
    return text
  end
end
