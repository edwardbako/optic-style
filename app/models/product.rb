class Product < ApplicationRecord

  has_many :views, class_name: 'ProductView', dependent: :destroy

  monetize :price_kopecks

  scope :published, -> { where(published: true) }

  after_create :build_default_view

  def build_default_view
    views.create(default: true)
  end
end
