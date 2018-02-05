class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :custumer
      t.integer :drink_id
      t.integer :quantity
      t.integer :order_id
      t.string :ice
      t.string :sugar

      t.timestamps
    end
  end
end
