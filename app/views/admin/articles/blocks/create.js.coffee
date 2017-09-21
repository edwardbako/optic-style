$('.article-blocks').append("<%= j render 'form' %>")

App.mount_fileupload()
$('a.caption-image-order-link').off 'click'
App.mount_caption_image_order()
App.mount_video_input()