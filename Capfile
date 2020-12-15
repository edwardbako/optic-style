# Load DSL and set up stages
require "capistrano/setup"
require 'capistrano/console'
# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile

require 'capistrano/rbenv'
# require 'capistrano/nodenv'
require 'capistrano/rails'
require 'capistrano/yarn'

# require 'capistrano/sidekiq'
# require 'capistrano/sidekiq/monit'
#
require 'capistrano/puma'
install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Daemon  # If you using puma daemonized (not supported in Puma 5+)
install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
# install_plugin Capistrano::Puma::Jungle # if you need the jungle tasks
# install_plugin Capistrano::Puma::Monit  # if you need the monit tasks
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
