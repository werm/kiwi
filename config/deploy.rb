set :application, "Kiwi"
set :repository,  "git@github.com:werm/kiwi.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'root'
set :deploy_to, '/home/cjw/domains/dev.cjw.im/kiwi/'
set :deploy_via, :remote_cache

role :web, "dev.cjw.im"                          # Your HTTP server, Apache/etc
role :app, "dev.cjw.im"                          # This may be the same as your `Web` server
role :db,  "dev.cjw.im", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end