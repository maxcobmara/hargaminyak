set :application_name, 'hargaminyak'
set :domain, '172.104.190.12'
set :deploy_to, '/var/www/hargaminyak.info'
set :repository, 'git@github.com:maxcobmara/hargaminyak.git'
set :branch, 'master'
set :rails_env, 'production'

# Optional settings:
set :user, 'root'          # Username in the server to SSH to.
set :ssh_options, '-A'
set :forward_agent, true     # SSH forward_agent.
set :start_port, 3000
