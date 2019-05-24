class CreateClientSms < ActiveRecord::Migration[5.1]
  def change
    create_table :client_sms do |t|
      t.references :client_phone, foreign_key: true
      t.text :text
      t.integer :status
      t.string :status_text
      t.string :sms_id, index: true
      t.float :cost

      t.timestamps
    end
  end
end
