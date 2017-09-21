<%- if params[:to_publish].present? %>

$("#<%= @article.id %>.article").replaceWith("<%= j render @article,
    type: (params[:type] == 'short' ? :short : :full) %>")

<%- else %>

$("form#edit_article_<%= @article.id %>.edit_article").replaceWith("<%= j render 'form' %>")

<%- end %>

App.update_images()
App.mount_fileupload()
App.mount_caption_image_order()
App.mount_video_input()