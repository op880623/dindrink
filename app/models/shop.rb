class Shop < ApplicationRecord
  has_many :drinks, dependent: :destroy
  has_many :orders, dependent: :destroy
end
