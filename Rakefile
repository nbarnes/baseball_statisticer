task :default => [:test]

task :test_league do
  ruby 'test/baseball_league_test.rb'
end

task :test do
  ruby 'test/factory_import_test.rb'
end

task :test_main do
  ruby 'main.rb ./test/players.csv ./test/stats.csv'
end

task :main do
  ruby 'main.rb ./Master-small.csv ./Batting-07-12.csv'
end