class ProductsController < ApplicationController

  def index
    @page = params[:page].to_i || 0
    @products = Product.published.limit(page_size).offset(@page * page_size)
    @next_page_size = Product.published.limit(page_size).offset((@page + 1) * page_size).count
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    @view = params[:view].present? ? @product.views.find(params[:view]) : @product.views.first
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def page_size
    12
  end
end