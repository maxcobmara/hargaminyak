require 'mina/bundler'
require 'mina/rails'
require 'mina/multistage'
require 'mina/git'
require 'mina/rbenv'  # for rbenv support. (https://rbenv.org)
require 'mina/puma'

set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/master.key')
set :shared_paths, ['tmp/pids', 'tmp/sockets']
set :puma_state, "#{fetch(:shared_path)}/tmp/sockets/puma.state"
set :puma_socket, "#{fetch(:shared_path)}/tmp/sockets/puma.sock"
set :puma_pid, "#{fetch(:shared_path)}/tmp/pids/puma.pid"

task :remote_environment do
  invoke :'rbenv:load'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0 --skip-existing}
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        invoke :'puma:phased_restart'
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
