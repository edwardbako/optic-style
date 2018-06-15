class Gram < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :next, lambda {|created| where('created_at < ?', created).order(created_at: :desc)}
  scope :previous, lambda {|created| where('created_at > ?', created).order(created_at: :desc)}

  def next
    self.class.next(self.created_at).first
  end

  def previous
    self.class.previous(self.created_at).last
  end
end
