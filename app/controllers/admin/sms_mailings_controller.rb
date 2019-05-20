class Admin::SmsMailingsController < AdminController
  before_action :set_api_key

  def show

  end

  private

  def set_api_key
    @api_key = Rails.application.secrets[:sms_api_id]
  end
end