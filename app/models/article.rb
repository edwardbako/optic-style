class Article < ApplicationRecord
  belongs_to :user

  has_many :article_blocks, dependent: :destroy
  accepts_nested_attributes_for :article_blocks, allow_destroy: true

  scope :published, -> { where(published: true) }

  before_save :update_published_date

  def update_published_date
    self.published_at = published? ? Time.now : nil if published_changed?
  end

end
