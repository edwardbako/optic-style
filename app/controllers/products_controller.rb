class ProductsController < ApplicationController
  before_action :set_page, only: [:index, :show]

  def index
    products = Product.published.order(created_at: :desc).limit(page_size)
    set_products_from_collection products

    @titles_list += ['Товары']
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    @view = params[:view].present? ? @product.views.find(params[:view]) : @product.views.first

    products = @product.children_flatten.published.order(created_at: :desc).limit(page_size)
    set_products_from_collection products

    @titles_list += ['Товары', @product.name]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_products_from_collection(collection)
    @products = collection.offset(@page * page_size)
    @next_page_size = collection.offset((@page + 1) * page_size).count

    @folders = if @product.present?
                 @product.children.folders
               else
                 Product.top_level_folders.folders
               end
  end

  def page_size
    8
  end
end