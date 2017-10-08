class Product < ApplicationRecord

  include Parentable
  parentable_class_name 'Product'

  has_many :views, class_name: 'ProductView', dependent: :destroy

  monetize :price_kopecks, as: :price

  scope :published, -> { where(published: true) }
  scope :featured, -> { where(featured: true) }

  after_create :build_default_view

  def build_default_view
    views.create(default: true)
  end

  before_destroy do
    views.clear
  end

  def breadcrumb_name
    is_folder? ? name : "#{name} - #{sku}"
  end

  def to_param
    [id, name.parameterize].join('-')
  end
end
