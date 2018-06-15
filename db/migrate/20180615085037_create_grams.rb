class CreateGrams < ActiveRecord::Migration[5.1]
  def change
    create_table :grams do |t|
      t.text :body
      t.string :image
      t.boolean :published, default: false
      t.references :user

      t.timestamps
    end
  end
end
