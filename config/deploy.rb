# config valid only for current version of Capistrano
# lock '3.6.0'
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} rbenv exec"
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

# set :nodenv_node_dir, "$HOME/.nodenv/versions/15.4.0/bin/node"
set :nodenv_node, File.read('.node-version').strip
set :nodenv_map_bins, %w{node npm yarn webpack rake}

set :application, 'optic-style'
set :repo_url, 'git@github.com:edwardbako/optic-style.git'

set :deploy_to, '/home/deploy/www/optic-style'


set :puma_threads,    [2, 16]
set :puma_workers,    2
set :puma_enable_socket_service, true
set :puma_phased_restart, true

append :linked_files, 'config/master.key', 'config/schedule.yml', 'public/robots.txt'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system',
       'public/uploads'

set :keep_releases, 5
set :pty,  false

after 'deploy:published', 'webpacker:compile'
after 'deploy:published', 'puma:restart'
after 'deploy:published', 'seed'
# after 'deploy:published', :generate_500_html
# after 'deploy:published', :generate_sitemap