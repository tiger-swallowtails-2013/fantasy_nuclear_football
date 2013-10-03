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
begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

desc "load recent data from the Sunlight Foundation"
task "worker:sunlight_scraper" do
  puts "A worker is talking to the sunlight API, and it should be talking back"
  SunlightScraper.scrape
end

desc "clear out SunlightScore database and update Scores"
task "worker:update_sunlight_scores" do
  puts "A worker is cleaning out the SunlightScores database and loading the Scores table"
  AddSunlightScores.update
end
