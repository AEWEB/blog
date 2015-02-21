# rubocop:disable Metrics/LineLength
# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'blog'
set :repo_url, 'git@github.com:AEWEB/blog.git'
set :keep_releases, 5

set :rbenv_type, :system # :system or :user
set :rbenv_ruby, '2.1.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all # default value

set :unicorn_pid, '/tmp/unicorn.pid'

set :use_sudo, false
# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []　set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

desc 'execute before deploy'
task :db_create do
  on roles(:db) do |_host|
    execute "mysql -uroot -e 'CREATE DATABASE IF NOT EXISTS blog_#{fetch(:rails_env)};'"
  end
end

desc 'install image magic'
task :install_image_magick do
  on roles(:app) do
    execute 'sudo yum -y install ImageMagick ImageMagick-devel'
  end
end
