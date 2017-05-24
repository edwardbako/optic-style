$("#posts").append("<%= j render partial: 'posts/pagination', formats: [:html] %>")

$("#load_more").html("<%= j render partial: 'posts/load_more', formats: [:html] %>")