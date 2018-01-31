class Drink < ApplicationRecord
  belongs_to :shop
  has_many :entries, dependent: :destroy
end
