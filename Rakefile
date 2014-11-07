task :default => [:test]

task :test do
  ruby 'test/player_import_test.rb'
  ruby 'test/stats_import_test.rb'
end

task :test_player_import do
  ruby 'test/player_import_test.rb'
end

task :test_stats_import do
  ruby 'test/stats_import_test.rb'
end

task :test_main do
  ruby 'main.rb ./test/players.csv ./test/stats.csv'
end

task :main do
  ruby 'main.rb ./Master-small.csv ./Batting-07-12.csv'
end