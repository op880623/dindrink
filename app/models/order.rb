class Order < ApplicationRecord
  include Hashid::Rails
  has_many :entries, dependent: :destroy
  belongs_to :shop
end
