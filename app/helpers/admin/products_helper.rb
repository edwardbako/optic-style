module Admin::ProductsHelper

  def back_url(product)
    if product.parent.present?
      admin_product_path(product.parent, page: params[:page])
    else
      admin_products_path(page: params[:page])
    end
  end
end
