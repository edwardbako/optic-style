$("#products").append("<%= j render partial: 'products/gallery', formats: [:html] %>")

$("#load_more").html("<%= j render partial: 'products/load_more', formats: [:html] %>")