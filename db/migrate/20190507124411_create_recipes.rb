class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.date :date
      t.string :od_sph
      t.string :od_cyl
      t.string :od_ax
      t.string :od_add
      t.string :os_sph
      t.string :os_cyl
      t.string :os_ax
      t.string :os_add
      t.string :dp
      t.string :comment
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
