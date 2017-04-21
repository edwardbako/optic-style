class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :address
      t.string :short_address
      t.string :phone
      t.string :open_hours, array: true
      t.string :email

      t.timestamps
    end
  end
end
