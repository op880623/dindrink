class CreateShops < ActiveRecord::Migration[5.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :menu

      t.timestamps
    end
  end
end
