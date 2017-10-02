$("#articles").append("<%= j render partial: 'articles/pagination', formats: [:html] %>")

$("#load_more").html("<%= j render partial: 'articles/load_more', formats: [:html] %>")