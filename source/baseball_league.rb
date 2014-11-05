require_relative './player.rb'
require_relative './stat_line.rb'
require_relative './player_factory.rb'
require_relative './season_stats_factory.rb'

class BaseballLeague
  attr_reader :players, :teams

  def initialize
    @players = Array.new
    @teams = Array.new
  end

  def add_player(player)
    @players.push(player) unless has_player_id?(player.player_id)
  end

  def add_players_from_csv(file_name, verbose=false)
    PlayerFactory.import_from_csv_file(file_name, verbose).each do |player_hash|
      add_player(Player.new(player_hash))
    end
  end

  def has_player_id?(player_id)
    return @players.any? { |player| player.player_id == player_id}
  end

  def add_stats_from_csv(file_name, verbose=false)
    stat_lines = SeasonalStatsFactory.import_from_csv_file(file_name, false)
    stat_lines = stat_lines.map { |stat_line| StatLine.new(stat_line) }
    stat_lines.each { |stat_line| add_stat_line(stat_line, verbose) }
  end

  def add_stat_line(stat_line, verbose=false)
    players_matching_id = @players.find_all do |player|
      player.player_id == stat_line.player_id
    end
    if players_matching_id.length > 1
      puts "Error, multiple players matching id #{stat_line.player_id}" if verbose
    elsif players_matching_id.empty?
      puts "No playerid matching #{stat_line.player_id} in BaseballLeague.add_stats_from_csv" if verbose
    else
      players_matching_id[0].add_stat_line(stat_line)
    end
  end

  def dump_players()
    puts "#{@players}"
  end

end