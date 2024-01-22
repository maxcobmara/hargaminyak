require 'puma/daemon'
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }
environment "production"

bind  "unix:///var/www/hargaminyak.info/shared/tmp/sockets/puma.sock"
pidfile "/var/www/hargaminyak.info/shared/tmp/pids/puma.pid"
state_path "/var/www/hargaminyak.info/shared/tmp/sockets/puma.state"
directory "/var/www/hargaminyak.info/current"

workers 2
threads 1,2

daemonize true

activate_control_app 'unix:///var/www/hargaminyak.info/shared/tmp/sockets/pumactl.sock'
prune_bundler
plugin :tmp_restart
