class WelcomeController < ApplicationController

  def index
    @breaking_news = Post.all.order(created_at: :desc).limit(4)
    @featured_products = Product.featured.limit(4)
    @recent_articles = Article.published.order(published_at: :desc).limit(3)

    @default_title = 'Оптика Стиль Новосибирск'
    @titles_list = ['Официальный сайт сети салонов']
    @meta_description = <<EOS
Мы помогаем людям видеть лучше. В стильной оправе вы будете выглядеть ярко и
модно. А в мякгих контактных линзах вы забудете о проблемах со зрением.
Далее...
EOS

  end

  def contacts
    @id = params[:id]

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