require_relative './player.rb'
require_relative './stat_line.rb'
require_relative './player_factory.rb'
require_relative './season_stats_factory.rb'
require 'pry'

class BaseballLeague
  attr_reader :players

  def initialize
    @players = Array.new
    @teams = Array.new
  end

  def add_player(player)
    @players.push(player) unless has_player_id?(player.player_id)
  end

  def add_players_from_csv(file_name, verbose=false)
    import_results = PlayerFactory.import_from_csv_file(file_name, verbose)
    import_results[:players].each do |player_hash|
      add_player(Player.new(player_hash))
    end
    return import_results[:errors]
  end

  def has_player_id?(player_id)
    return @players.any? { |player| player.player_id == player_id}
  end

  def add_stats_from_csv(file_name, verbose=false)
    import_results = SeasonalStatsFactory.import_from_csv_file(file_name, false)
    errors = []
    import_results[:stat_lines].each do |stat_hash|
      error = add_stat_line(stat_hash, verbose)
      if error != nil
        errors.push(error)
      end
    end
    return errors
  end

  def add_stat_line(stat_hash, verbose=false)
    stat_line = StatLine.new(stat_hash)
    players_matching_id = @players.find_all do |player|
      player.player_id == stat_line.player_id
    end
    if players_matching_id.length > 1
      return {error: "Error, multiple players matching id", stat_hash: stat_hash}
    elsif players_matching_id.empty?
      return {error: "No playerid matching #{stat_line.player_id}", stat_hash: stat_hash}
    else
      players_matching_id[0].add_stat_line(stat_line)
      return nil
    end
  end

end