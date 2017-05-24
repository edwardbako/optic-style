class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_page
    @page = params[:page].to_i || 0
  end
end
