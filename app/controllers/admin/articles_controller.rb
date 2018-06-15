class Admin::ArticlesController < AdminController
  include ArticleParams

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  # GET /admin/articles.json
  def index
    @articles = Article.all.order(created_at: :desc).page(params[:page]).per_page(10)
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @article = Article.create(user: current_user, title: 'default')
    image_block = ArticleBlock::Image.create
    text_block = ArticleBlock::Text.create
    @article.article_blocks << image_block
    @article.article_blocks << text_block
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles
  # POST /admin/articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Статья создана.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1
  # PATCH/PUT /admin/articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_articles_path, notice: 'Статья сохранена.' }
        format.json { render :show, status: :ok, location: @article }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Статья удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

end
