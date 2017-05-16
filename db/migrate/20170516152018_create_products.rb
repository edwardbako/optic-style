class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.string :size
      t.string :color
      t.string :weight
      t.string :material
      t.json :images
      t.monetize :price

      t.timestamps
    end
  end
end
