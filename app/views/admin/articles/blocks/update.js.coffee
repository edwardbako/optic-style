$(".block-fields#<%= @block.id %> .upload-area")
  .css('background-image', "url(<%= @block.image.url(:mid) %>?#{+new Date()}")
