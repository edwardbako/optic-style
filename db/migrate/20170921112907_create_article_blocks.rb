class CreateArticleBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_blocks do |t|
      t.references :article, foreign_key: true
      t.text :text
      t.string :image
      t.string :video
      t.string :audio
      t.string :type

      t.timestamps
    end
  end
end
