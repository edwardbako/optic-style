class Admin::PostsController < AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per_page(10)
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @post = Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_path(@post),
                                  notice: 'Новость сохдана.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_post_path(@post),
                                  notice: 'Новость обновлена.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Новость удалена.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :published, :user_id)
    end
end
