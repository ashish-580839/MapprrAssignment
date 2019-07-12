class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :sku_id, null: false
      t.date :expire_date, null: false
      t.integer :price, null: false

      t.text :images

      t.timestamps
    end

    add_index :products, :sku_id, unique: true
  end
end
