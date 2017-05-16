class Product < ApplicationRecord

  mount_uploaders :images, ImageUploader

  monetize :price_kopecks
end
