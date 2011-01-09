require 'bundler/capistrano'

set :application, 'railstemplates.org'
set :repository, "git@github.com:rodrigoflores/Railstemplates.git"

set :user, 'deploy'
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"

set :scm, :git
set :branch, "production"

set :config_dir, "#{deploy_to}/shared/config"



server application, :app, :web, :db, :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:symlink" do
  run "ln -nfs #{config_dir}/database.yml #{release_path}/config/database.yml"
  run "cd #{release_path} ; jammit"
  run "cd #{release_path} ; rake ts:conf RAILS_ENV=production ; rake ts:reindex RAILS_ENV=production"
end

require 'config/boot'
require 'hoptoad_notifier/capistrano'
