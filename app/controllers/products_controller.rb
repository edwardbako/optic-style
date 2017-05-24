class ProductsController < ApplicationController
  before_action :set_page, only: [:index]

  def index
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
    6
  end
end