$("#<%= @product.id %>.product").replaceWith("<%= j render partial: 'admin/products/product',
                                                          object: @product %>")