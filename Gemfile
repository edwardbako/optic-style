source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~>5.2.0'
gem 'bootsnap', require: false
gem 'webpacker'
gem 'pg' # Use postgresql as the database for Active Record
gem 'pg_search' # builds ActiveRecord named scopes that take advantage of PostgreSQL’s full text search
gem 'puma' # Use Puma as the app server
gem 'faraday' # HTTP client on Rack, with support for multiple backends.
gem 'faraday_utf'
gem 'google-api-client'

gem 'will_paginate' # Pagination library
gem 'will_paginate-bootstrap' # Bootstrap styles for pagination links
gem 'dynamic_sitemaps'

gem 'russian' # I18n

gem 'sass-rails' # Use SCSS for stylesheets
gem 'slim-rails' # Slim markup for templates
gem 'bootstrap-sass' # Bootstrap stylesheets
gem 'font-awesome-rails' # Font-awesome icons
# gem 'ionicons-rails' # Ion icons
gem 'material_icons' # Material icons

gem 'uglifier' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails' # Use CoffeeScript for .coffee assets and views

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails' # Use jquery as the JavaScript library
gem 'jquery-ui-rails'
gem 'jquery-fileupload-rails'

gem 'turbolinks' # Turbolinks makes navigating your web application faster.
gem 'jbuilder' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

gem 'trix' # Trix WYSIWYG editor
gem 'truncate_html'

# gem 'redis', '~> 3.0' # Use Redis adapter to run Action Cable in production
gem 'sidekiq' # Queueing framework
gem 'sidekiq-cron' # Cron jobs for queueing
gem 'sinatra', :require => nil

gem 'bcrypt' # Use ActiveModel has_secure_password
gem 'devise' # Rack authentication

gem 'money-rails'

gem 'carrierwave' # solution for file uploads
gem 'mini_magick'# A ruby wrapper for ImageMagick

gem 'roo' # Spreadsheet parsing
gem 'roo-xls'

gem 'pry-byebug' # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
gem 'pry-rails'
gem 'pry-doc'
gem 'pry-stack_explorer'
gem 'colorize' # Colorize strings output

group :development, :test do
  gem 'rspec-rails' # RSpec testing framework
  gem 'cucumber-rails', :require => false
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'

  gem 'letter_opener' # Open emails in browser

  gem 'capistrano'
  gem 'capistrano-rails'
  # gem 'capistrano-rvm'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-nodenv'
  gem 'capistrano-yarn'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
