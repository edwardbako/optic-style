class Branch < ApplicationRecord

  default_scope { order(position: :asc)}

  has_many :views, class_name: 'BranchView', dependent: :destroy

  validates :short_address, presence: true, uniqueness: true

  before_save :set_slug

  after_create :build_default_view

  before_destroy do
    views.clear
  end

  def to_param
    short_address.parameterize
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

  def build_default_view
    views.create(default: true)
  end

end
