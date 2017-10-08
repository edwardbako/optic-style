class AddSlugToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :slug, :string
  end
end
