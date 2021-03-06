class ArticlesController < ApplicationController

  before_action :set_page, only: [:index]

  def index
    @titles_list += ['Статьи']

    articles = Article.published.order(published_at: :desc).limit(page_size)
    @articles = articles.offset(@page * page_size)
    @next_page_size = articles.offset((@page + 1) * page_size).count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @article = Article.find(params[:id])
    @latest = Article.published.order(published_at: :desc)
                .where.not(slug: params[:id]).limit(latest_size)

    @titles_list += ['Статьи', @article.title]
  end

  private

  def page_size
    6
  end

  def latest_size
    4
  end
end