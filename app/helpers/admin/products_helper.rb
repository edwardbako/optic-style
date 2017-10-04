module Admin::ProductsHelper

  def back_url(product)
    if product.parent.present?
      admin_product_path(product.parent, page: params[:page])
    else
      admin_products_path(page: params[:page])
    end
  end

  def new_admin_product_conditional_path(product, folder: false)
    if product.present?
      new_admin_product_path(parent: product, is_folder: folder)
    else
      new_admin_product_path(is_folder: folder)
    end
  end
end
