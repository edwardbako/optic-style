class AddMapToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :map, :text
  end
end
