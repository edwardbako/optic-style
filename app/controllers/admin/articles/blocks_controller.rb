class Admin::Articles::BlocksController < AdminController

  include ArticleParams

  before_action :set_article
  before_action :set_block, only: [:update, :destroy]

  def create
    @block = @article.article_blocks.create(type: params[:type])
  end

  def update

    respond_to do |format|
      if @article.update(article_params)
        format.js { set_block }
      end
    end
  end

  def destroy
    @block.destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_block
    @block = @article.article_blocks.find(params[:id])
  end

end