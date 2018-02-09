class AddCustomToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :custom, :boolean, default: false
  end
end
