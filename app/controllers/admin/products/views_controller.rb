class Admin::Products::ViewsController < AdminController

  before_action :set_product
  before_action :set_view, only: [:update, :destroy]

  def index
    @views = @product.views.uploaded.order(created_at: :desc)
  end

  def create
    @view = @product.views.create(view_params)
    respond_to do |format|
      if @view.save!
        format.html { redirect_to admin_product_views_path(@product),
                                  notice: 'Изображение загружено.' }
        format.js
      else
        format.html { render :index }
        format.js { render text: "alert('Tro-lo-lo');" }
      end
    end
  end

  def update

  end

  def destroy
    @view.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_views_path(@product),
                                notice: 'Изображение удалено.' }
    end
  end

  private

  def set_view
    @view = @product.views.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def view_params
    params.require(:product_view).permit(:image, :description, :position)
  end


end