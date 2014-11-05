require_relative '../source/baseball_league.rb'

league = BaseballLeague.new()
league.add_players_from_csv('test/players.csv', false)
league.add_stats_from_csv('test/stats.csv', false)

league.players.each do |player|
  puts "#{player.name}, batting average #{player.ba_string}"
end