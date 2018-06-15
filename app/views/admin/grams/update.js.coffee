$("form#edit_gram_<%= @gram.id %>.edit_gram").replaceWith("<%= j render 'form' %>")

App.mount_fileupload()