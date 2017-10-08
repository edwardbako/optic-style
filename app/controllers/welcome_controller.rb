class WelcomeController < ApplicationController

  def index
    @breaking_news = Post.all.order(created_at: :desc).limit(4)
    @featured_products = Product.featured.limit(4)
    @recent_articles = Article.published.order(published_at: :desc).limit(3)
  end

  def contacts
    @id = params[:id].to_i

    @titles_list += ['Контакты']
    params[:id].present? ? @titles_list += [Branch.find(@id).short_address] : false
  end

  def service
    @titles_list += ['Услуги']
  end

  def reviews
    @titles_list += ['Отзывы']
  end

end