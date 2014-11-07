# playerID,yearID,league,teamID,G,AB,R,H,2B,3B,HR,RBI,SB,CS
require 'pry'

class StatLine
  attr_reader :player_id
  attr_reader :team, :year, :league, :games, :at_bats, :runs, :hits, :doubles
  attr_reader :triples, :home_runs, :runs_batted_in, :stolen_bases, :caught_stealing

  def initialize(stats_hash)
    @player_id = stats_hash[:playerid]
    @team = stats_hash[:teamid]
    @year = stats_hash[:yearid]
    @league = stats_hash[:league]
    @games = stats_hash[:g] || 0
    @at_bats = stats_hash[:ab] || 0
    @runs = stats_hash[:r] || 0
    @hits = stats_hash[:h] || 0
    @doubles = stats_hash[:"2b"] || 0
    @triples = stats_hash[:"3b"] || 0
    @home_runs = stats_hash[:hr] || 0
    @runs_batted_in = stats_hash[:rbi] || 0
    @stolen_bases = stats_hash[:sb] || 0
    @caught_stealing = stats_hash[:cs] || 0
  end

  def slugging
    total_bases = @hits + (@doubles * 2) + (@triples * 3) + (@home_runs * 4)

    if (total_bases != 0)
      return (total_bases.to_f / @at_bats)
    else
      return 0.0
    end
  end

  def to_s

  end

end