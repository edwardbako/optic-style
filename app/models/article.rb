class Article < ApplicationRecord
  belongs_to :user

  has_many :article_blocks, dependent: :destroy
  accepts_nested_attributes_for :article_blocks, allow_destroy: true

  scope :published, -> { where(published: true) }

  before_save :update_published_date

  def update_published_date
    self.published_at = published? ? Time.now : nil if published_changed?
  end

  validates :title, presence: true, uniqueness: true

  before_save :set_slug

  def to_param
    title.parameterize
  end

  def set_slug
    self.slug = to_param
  end

  def self.find(input)
    input.is_a?(String) ? find_by_slug(input) : super
  end

  def self.regenerate_slugs
    all.each do |r|
      r.set_slug
      r.save
    end
  end

end
