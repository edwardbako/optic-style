class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]

  has_many :user_notifications
  has_many :notifications, through: :user_notifications

  def full_name
    "#{first_name} #{last_name}"
  end

  def check_notification(notification)
    uns = user_notifications.where(notification: notification)
    uns.each do |un|
      un.got_it!
    end
  end
end
