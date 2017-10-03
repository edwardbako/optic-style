module Parentable
  extend ActiveSupport::Concern

  included do
    scope :top_level_folders, -> { where(parent: nil) }
  end

  def top_level?
    parent.blank?
  end

  def parents
    if self.parent.present?
      self.parent.parents << self.parent
    else
      []
    end
  end

  class_methods do
    def parentable_class_name(class_name)
      @@parentable_class_name = class_name
      has_many :children, class_name: @@parentable_class_name, foreign_key: 'parent_id'
      belongs_to :parent, class_name: @@parentable_class_name, optional: true, counter_cache: true
    end
  end

end