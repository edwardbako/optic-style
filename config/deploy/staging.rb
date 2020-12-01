server '185.43.5.243', port: 22, user: 'deploy', roles: %w(app web db)

set :stage, :staging
set :rails_env, :staging

set :branch, :master
