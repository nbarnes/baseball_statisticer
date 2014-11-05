require_relative '../source/player_factory.rb'
require_relative '../source/season_stats_factory.rb'

players = PlayerFactory.import_from_csv_file('test/players.csv', false)
stat_lines = SeasonalStatsFactory.import_from_csv_file('test/stats.csv', false)

puts "#{players.inspect}"
puts "#{stat_lines.inspect}"