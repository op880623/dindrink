class AddShopToDrink < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :shop_id, :integer
  end
end
