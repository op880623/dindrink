class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :price
      t.text :option

      t.timestamps
    end
  end
end
