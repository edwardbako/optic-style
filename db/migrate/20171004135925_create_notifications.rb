class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :icon, default: 0
      t.text :text

      t.timestamps
    end
  end
end
