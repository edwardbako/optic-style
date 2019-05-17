$('#clients').replaceWith("<%= j render 'pagination', formats: [:html] %>")
<%- if params[:search].blank? %>
$('input#search').val('')
<%- end %>