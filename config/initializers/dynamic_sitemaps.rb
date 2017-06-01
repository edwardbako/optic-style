DynamicSitemaps.configure do |config|
  config.search_engine_ping_urls << 'http://ping.blogs.yandex.ru/ping?sitemap=%s'
  config.ping_environments << 'staging'
end