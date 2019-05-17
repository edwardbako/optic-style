class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :phone, array: true, default: []
      t.string :email
      t.text :comment
      t.date :birth_date
      t.boolean :personal_data_agreement, default: true
      t.boolean :email_notification_agreement, default: true
      t.boolean :sms_notification_agreement, default: true
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
