$("#product_<%= @product.id %>").replaceWith("<%= j render template: 'products/show',
                                                            formats: [:html] %>")