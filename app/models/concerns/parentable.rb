module Parentable
  extend ActiveSupport::Concern

  included do
    scope :top_level_folders, -> { where(parent: nil) }
    scope :folders, -> { where(is_folder: true) }
    scope :not_folders, -> { where(is_folder: false) }
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

  def parents_ids
    parents.map { |p| p.id }
  end

  def children_flatten
    self.class.where id: children_flatten_ids
  end

  def children_flatten_ids
    list = children.not_folders.ids
    children.folders.each do |child|
      list += child.children_flatten_ids
    end
    list
  end

  class_methods do
    def parentable_class_name(class_name)
      @@parentable_class_name = class_name
      has_many :children, class_name: @@parentable_class_name, foreign_key: 'parent_id'
      belongs_to :parent, class_name: @@parentable_class_name, optional: true, counter_cache: true
    end
  end

end