class SmsController < ApplicationController

  # before_action :check_origin

  TRUSTED_ORIGINS = %w(https://sms.ru http://localhost:3000)

  def callback
    logger.warn "SMS: ORIGIN #{request.headers['origin']}, REFERER: #{request.referer}"
    logger.warn "SMS: PARAMS #{params}"

    render plain: 100
  end

  private

  def check_origin
    binding.pry
    unless TRUSTED_ORIGINS.include? request.headers['origin']
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end