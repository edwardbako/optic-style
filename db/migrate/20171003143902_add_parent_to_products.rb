class AddParentToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :parent_id, :integer, foreign_key: true
    add_column :products, :is_folder, :boolean, default: false
  end
end
