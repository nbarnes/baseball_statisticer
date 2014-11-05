# A) the most improved batting average from 2009 to 2010, for players with at
# least 200 at-bats
# B) the slugging percentage of all players on the 2008 Oakland A's
# C) the AL and NL triple crown winners for 2011 and 2012 (application will
# output '(No winner' if there was no triple crown winner that year)

require 'CSV'
require 'pry'
require_relative './main_helper.rb'

require_relative './source/baseball_league.rb'

players_file_name = ARGV[0]
stats_file_name = ARGV[1]

league = BaseballLeague.new

league.add_players_from_csv(players_file_name)
league.add_stats_from_csv(stats_file_name)

most_improved = most_improved_batting_average(league, 2009, 2010)
puts "Most Improved BA, 2009 to 2010"
puts "#{most_improved[:player_name]}, #{sprintf("%#.3f", most_improved[:delta])[1, 4]}"
puts ""

oak_2008_slugging = team_slugging(league, 'OAK', 2008)
puts "Oakland 2008 slugging percentages"
oak_2008_slugging.each do |slugger|
  puts "#{slugger[:player_name]} #{sprintf("%#.3f", slugger[:slugging])[0, 5]}"
end
puts ""

def puts_triple_crown_winner(league, al_nl_league, year)
  winner = triple_crown_winner(league, al_nl_league, year)
  if winner
    puts "The #{year} #{al_nl_league} triple crown winner is #{winner.name}"
  else
    puts "No #{al_nl_league} triple crown winner in #{year}"
  end
end

puts_triple_crown_winner(league, "AL", 2011)
puts_triple_crown_winner(league, "AL", 2012)
puts_triple_crown_winner(league, "NL", 2011)
puts_triple_crown_winner(league, "NL", 2012)

# File.open("league_output.txt", "w") do |f|
#   f.write(mlb.to_s)
# end
