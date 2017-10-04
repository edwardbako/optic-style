class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :notification

  def got_it!
    update(checked: true)
  end

end
