class Admin::UserNotificationsController < AdminController

  def update
    current_user.check_notification Notification.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end