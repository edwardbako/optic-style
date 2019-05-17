class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.date :date
      t.string :number
      t.string :frame
      t.string :lenses
      t.string :sum
      t.string :comment
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
