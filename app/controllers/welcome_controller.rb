class WelcomeController < ApplicationController

  def index
    @breaking_news = Post.all.order(created_at: :desc).limit(4)
  end

  def contacts
    @id = params[:id].to_i
  end

  def sevice

  end

  def reviews

  end

end