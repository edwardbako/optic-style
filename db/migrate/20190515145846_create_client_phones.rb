class CreateClientPhones < ActiveRecord::Migration[5.1]
  def change
    create_table :client_phones do |t|
      t.string :number
      t.references :client, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
