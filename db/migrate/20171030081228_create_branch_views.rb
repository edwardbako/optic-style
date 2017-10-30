class CreateBranchViews < ActiveRecord::Migration[5.1]
  def change
    create_table :branch_views do |t|
      t.string :image
      t.string :description
      t.integer :position
      t.boolean :default, default: false
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
