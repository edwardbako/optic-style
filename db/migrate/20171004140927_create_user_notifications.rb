class CreateUserNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_notifications do |t|
      t.references :user, foreign_key: true
      t.references :notification, foreign_key: true
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
