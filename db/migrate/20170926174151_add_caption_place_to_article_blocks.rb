class AddCaptionPlaceToArticleBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :article_blocks, :caption_place, :integer, default: 0
  end
end
