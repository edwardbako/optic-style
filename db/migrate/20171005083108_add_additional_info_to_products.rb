class AddAdditionalInfoToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :info, :text
  end
end
