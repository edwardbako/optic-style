class AddPositionToBranches < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :position, :integer
  end
end
