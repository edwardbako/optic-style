$("#grams").append("<%= j render partial: 'grams/gallery', formats: [:html] %>")

$("#load_more").html("<%= j render partial: 'grams/load_more', formats: [:html] %>")