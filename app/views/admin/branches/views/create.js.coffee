$('#branch_views .placeholder').hide()

$('#branch_views').prepend("<%= j render partial: 'view', object: @view %>")