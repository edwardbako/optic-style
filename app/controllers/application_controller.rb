class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_titles_list
  before_action :set_default_title

  private

  def set_page
    @page = params[:page].to_i || 0
  end

  def set_default_title
    @default_title = 'Оптика Стиль'
  end

  def set_titles_list
    @titles_list = []
  end
end
