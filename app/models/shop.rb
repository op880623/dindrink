class Shop < ApplicationRecord
  mount_uploader :menu, MenuUploader
  has_many :drinks, dependent: :destroy
  has_many :orders, dependent: :destroy
end
