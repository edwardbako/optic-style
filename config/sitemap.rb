# Change this to your host. See the readme at https://github.com/lassebunk/dynamic_sitemaps
# for examples of multiple hosts and folders.
host "www.optika-style.ru"

sitemap :site do
  url root_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url service_url, last_mod: Time.now, change_freq: "monthly", priority: 1.0
  url reviews_url, last_mod: Time.now, change_freq: "daily", priority: 1.0
  url posts_url, last_mod: Post.last.updated_at, change_freq: "daily", priority: 1.0
  url products_url, last_mod: Product.last.updated_at, change_freq: "daily", priority: 1.0
  url articles_url, last_mod: Article.last.updated_at, change_freq: "weekly", priority: 1.0
  url contacts_url, last_mod: Branch.last.updated_at, change_freq: "monthly", priority: 1.0
end

sitemap_for Product.published
sitemap_for Article.published
# sitemap_for Post.all
sitemap_for Branch.all, name: :contacts do |contact|
  url contact_url(contact), last_mod: contact.updated_at, priority: 1.0
end

# You can have multiple sitemaps like the above – just make sure their names are different.

# Automatically link to all pages using the routes specified
# using "resources :pages" in config/routes.rb. This will also
# automatically set <lastmod> to the date and time in page.updated_at:
#
#   sitemap_for Page.scoped

# For products with special sitemap name and priority, and link to comments:
#
#   sitemap_for Product.published, name: :published_products do |product|
#     url product, last_mod: product.updated_at, priority: (product.featured? ? 1.0 : 0.7)
#     url product_comments_url(product)
#   end

# If you want to generate multiple sitemaps in different folders (for example if you have
# more than one domain, you can specify a folder before the sitemap definitions:
# 
#   Site.all.each do |site|
#     folder "sitemaps/#{site.domain}"
#     host site.domain
#     
#     sitemap :site do
#       url root_url
#     end
# 
#     sitemap_for site.products.scoped
#   end

# Ping search engines after sitemap generation:
#
  ping_with "https://#{host}/sitemap.xml"