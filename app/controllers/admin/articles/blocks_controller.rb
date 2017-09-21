class Admin::Articles::BlocksController < AdminController

  before_action :set_article

  def create
    @block = @article.article_blocks.create(type: params[:type])
  end

  def destroy
    @block = @article.article_blocks.find(params[:id])
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

end