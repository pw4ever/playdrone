set :repository, 'https://github.com/pw4ever/playdrone.git'
set :scm, :git
set :branch, 'master'
set :deploy_via, :remote_cache
set :scm_verbose, true

set :user, 'root'
set :use_sudo, false
ssh_options[:forward_agent] = true

set :application, 'playdrone'
#set :rvm_ruby_string, 'ruby-2.1'
set :deploy_to, "/srv/#{application}"
set :keep_releases, 3
set :normalize_asset_timestamps, false
set :rake, 'bundle exec rake'
set :rvm_type, :system

set :whenever_roles, [:sidekiq, :master]
set :whenever_command, 'bundle exec whenever'

#role :unicorn, *(1..4).map { |i| "node#{i.to_s.rjust(2,'0')}.playdrone.io" }
#role :sidekiq, *(1..4).map { |i| "node#{i.to_s.rjust(2,'0')}.playdrone.io" }
#role :metrics, 'node01.playdrone.io'
#role :master,  'node01.playdrone.io'
role :unicorn, '10.1.1.11'
role :sidekiq, '10.1.1.11'
role :metrics, '10.1.1.11'
role :master, '10.1.1.11'
