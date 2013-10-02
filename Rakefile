$LOAD_PATH.unshift(File.expand_path('./config'))

require 'main'
require 'sinatra/activerecord/rake'

require_relative './lib/seed_politicians'

desc "create a local pg database with call to exec"
task "db:create" do
  puts "touch #{DB_NAME} if it doesn't already exist"
  exec "createdb #{DB_NAME}"
end

desc "drop local pg database"
task "db:drop" do
  puts "rm-f #{DB_NAME}"
  exec "dropdb #{DB_NAME}"
end

desc "seed the politicians database"
task "db:seed" do
	puts "seeding with only the corrupt politicians"
	PoliticiansImporter.import
end