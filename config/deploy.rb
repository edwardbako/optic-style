# config valid only for current version of Capistrano
# lock '3.6.0'
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :nvm_node, File.read('.node-version').strip
set :nvm_map_bins, %w{node npm yarn}

set :application, 'optic-style'
set :repo_url, 'git@github.com:edwardbako/optic-style.git'

set :deploy_to, '/home/deploy/www/optic-style'

set :yarn_bin, '/home/deploy/.nvm/versions/node/v15.4.0/bin/yarn'

set :puma_threads,    [2, 16]
set :puma_workers,    2

append :linked_files, 'config/master.key', 'config/schedule.yml', 'public/robots.txt'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system',
       'public/uploads'

set :keep_releases, 5
set :pty,  false

after 'deploy:published', 'puma:restart'
after 'deploy:published', 'seed'
after 'deploy:published', :generate_500_html
after 'deploy:published', :generate_sitemap