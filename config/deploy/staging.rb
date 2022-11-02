server '62.109.17.123', port: 22, user: 'deploy', roles: %w(app web db)

set :stage, :staging
set :rails_env, :staging

set :branch, :master
