class ProductsController < ApplicationController
  before_action :set_page, only: [:index]

  def index
    products = Product.published.order(created_at: :desc).limit(page_size)
    @products = products.offset(@page * page_size)
    @next_page_size = products.offset((@page + 1) * page_size).count

    @titles_list += ['Товары']
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    @view = params[:view].present? ? @product.views.find(params[:view]) : @product.views.first

    @titles_list += ['Товары', @product.name]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def page_size
    8
  end
end