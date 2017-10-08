class Branch < ApplicationRecord

  validates :short_address, presence: true, uniqueness: true

  before_save :set_slug

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
end
