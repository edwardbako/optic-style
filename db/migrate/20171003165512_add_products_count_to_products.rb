class AddProductsCountToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :products_count, :integer
  end
end
