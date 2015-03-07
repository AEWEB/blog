# -*- coding: utf-8 -*-
# ワーカーの数
worker_processes 2

# ソケット
listen 8080
pid '/tmp/unicorn.pid'

# ログ
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

preload_app true
timeout 360

before_fork do |server, _worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH # rubocop:disable Lint/HandleExceptions
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', ENV['RAILS_ROOT'])
end
