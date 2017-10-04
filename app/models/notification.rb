class Notification < ApplicationRecord

  has_many :user_notifications, dependent: :destroy
  has_many :users, through: :user_notifications

  enum icon: [:warning, :danger, :info, :success]

  before_create :link_users

  def checked_by?(user)
    user_notifications.where(user: user).first.checked?
  end

  def link_users
    self.users << User.all
  end

  def checked_count_human
    sum = 0
    users.each do |u|
      sum += 1 if checked_by? u
    end
    "<b>#{sum}</b> из <b>#{users.count}</b>".html_safe
  end

end
