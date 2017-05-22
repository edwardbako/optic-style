$('#product_views .placeholder').hide()

$('#product_views').prepend("<%= j render partial: 'view', object: @view %>")