class Article < ApplicationRecord
  belongs_to :user

  has_many :article_blocks, dependent: :destroy
  accepts_nested_attributes_for :article_blocks, allow_destroy: true

  scope :published, -> { where(published: true) }

end
