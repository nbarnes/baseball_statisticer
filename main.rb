# A) the most improved batting average from 2009 to 2010, for players with at
# least 200 at-bats
# B) the slugging percentage of all players on the 2008 Oakland A's
# C) the AL and NL triple crown winners for 2011 and 2012 (application will
# output '(No winner' if there was no triple crown winner that year)

require 'CSV'
require_relative './source/major_league_baseball'

player_data_file_name = ARGV[0]
seasonal_stats_data_file_name = ARGV[1]

mlb = MajorLeagueBaseball.new

CSV.foreach(player_data_file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
  mlb.add_player(row.to_hash)
end

mlb.dump_players

CSV.foreach(seasonal_stats_data_file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
  mlb.add_seasonal_stat_line(row.to_hash)
end

File.open("mlb_output.txt", "w") do |f|
  f.write(mlb.to_s)
end