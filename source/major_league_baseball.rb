require_relative './player.rb'
require_relative './season_stats.rb'

class MajorLeagueBaseball

  def initialize
    @players = Array.new
    @teams = Array.new
  end

  def players
  end

  def add_player(player)
    player = Player.new(player_hash)
    # puts "importing player hash = #{player_hash}"
    puts "new player = #{player.player_id}"
    unless has_player_id(player)
      @players.push(player)
    end
  end

  def add_seasonal_stat_line(stat_line)
  end

  def add_team(team_id)
  end

  def dump_players()
    puts "#{@players}"
  end

  def has_player_id(player)
  end

end