# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

FulbitoAppServer::Application.load_tasks

require 'neography/tasks'

task :db_start do
   system("sudo /etc/init.d/postgresql start")
   system("rake neo4j:start")
end