class Admin::ProductsController < AdminController

  include Admin::ProductsHelper

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    @products = Product.top_level_folders.order(is_folder: :desc).order(:name).page(params[:page]).per_page(10)
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
    @products = @product.children.order(is_folder: :desc).order(:name).page(params[:page])
  end

  # GET /admin/products/new
  def new
    @product = Product.new
    @product.parent = Product.find(params[:parent]) if params[:parent].present?
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to back_url(@product),
                                  notice: 'Продукт создан.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to back_url(@product),
                                  notice: 'Информация о продукте обновлена.' }
        format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to back_url(@product), notice: 'Продукт удален.' }
      format.json { head :no_content }
      # format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :sku, :description, :size, :color, :weight,
                                      :material, :price, :published, :is_folder, :parent_id)
    end

    def after_save_url
      if @product.parent.present?
        admin_product_path(@product.parent, page: params[:page])
      else
        admin_products_path(page: params[:page])
      end
    end
end
