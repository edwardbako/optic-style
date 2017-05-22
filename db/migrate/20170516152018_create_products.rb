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
      t.monetize :price
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
