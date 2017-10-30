class BranchView < ApplicationRecord
  belongs_to :branch

  mount_uploader :image, ImageUploader

  scope :uploaded, -> { where(default: false) }
  scope :default, -> { where(default: true) }

  after_create :remove_default_view

  after_destroy :build_default_view

  def remove_default_view
    branch.views.default.destroy_all if branch.views.default.size > 0 && !default?
  end

  def build_default_view
    if branch.views.default.size == 0 && !default? && branch.views.uploaded.size == 0
      branch.build_default_view
    end
  end

end
