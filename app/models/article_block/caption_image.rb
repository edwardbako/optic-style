class ArticleBlock::CaptionImage < ArticleBlock

  mount_uploader :image, ImageUploader

  enum caption_place: [:right, :left]

end
