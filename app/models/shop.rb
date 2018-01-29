class Shop < ApplicationRecord
  mount_uploader :menu, MenuUploader
  has_many :drinks, dependent: :destroy
end
