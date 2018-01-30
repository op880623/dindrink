class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :custumer
      t.integer :drink_id
      t.integer :quantity
      t.integer :order_id
      t.text :option

      t.timestamps
    end
  end
end
