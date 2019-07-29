lock "~> 3.11.0"
set :application, "recognizer"
set :repo_url, "git@github.com:ulversson/recognizer.git"
set :branch, "master"
set :deploy_to, "/home/deployer/apps/recognizer"
set :ssh_options, keys: ["config/deploy_id_rsa"] if File.exist?("config/deploy_id_rsa")

#set :linked_files, %w{config/database.yml}
set :rvm_ruby_version, "2.6.3"      # Defaults to: "default"
if fetch(:stage) == :digital
  set :rvm_custom_path, "/usr/share/rvm"
end  
#set :rvm_custom_path, "/Users/ulversson/.rvm"  # only needed if not detected# set :format, :pretty

set :linked_files, %w{config/database.yml config/secrets.yml}

namespace :deploy do

  desc "Restart application"
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute "touch  #{release_path}/tmp/restart.txt"
    end
  end

  before :updated, :symlink_shared do
    on roles(:web) do
      execute "rm #{release_path}/config/database.yml"
      execute "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      execute "ln -s #{shared_path}/.env #{release_path}/.env"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, "cache:clear"
      # end
    end
  end

  after :finishing, "deploy:cleanup"
  after "deploy:publishing", "deploy:restart"
  
end

namespace :yarn do
  task :install do
    # workaround to stop running yarn install after precompile
  end
end