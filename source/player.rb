
class Player

  attr_reader :player_id, :birth_year, :first_name, :last_name, :seasonal_stats

  def initialize(player_hash)
    @player_id = player_hash[:playerid]
    @birth_year = player_hash[:birthyear]
    @first_name = player_hash[:namefirst]
    @last_name = player_hash[:namelast]
    @seasonal_stats = Array.new
  end

  def add_stat_line(stat_line)
    @seasonal_stats.push(stat_line)
  end

  # NOTE: this returns the FLOAT VALUE of the batting average
  def batting_average(year: nil, team: nil)
    hits, at_bats = 0, 0

    seasonal_stats.each do |stat_line|
      year_match = stat_line.year == year || year == nil
      team_match = stat_line.team == team || team == nil
      if year_match && team_match
        hits += stat_line.hits
        at_bats += stat_line.at_bats
      end
    end

    if (at_bats != 0)
      return (hits.to_f / at_bats)
    else
      return 0.0
    end
  end

  def ba_string(ba = batting_average())
    return sprintf("%#.3f", ba)[1, 4]
  end

  def at_bats(year = nil, team = nil)
    at_bats = 0

    seasonal_stats.each do |stat_line|
      year_match = stat_line.year == year || year == nil
      team_match = stat_line.team == team || team == nil
      if year_match && team_match
        at_bats += stat_line.at_bats
      end
    end
    return at_bats
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def to_s
    "#{@player_id}, #{@first_name} #{@last_name}, #{@birth_year}"
  end

  # def baseball_card
  #   puts "#{@first_name} #{@last_name}"
  #   puts "Born #{birth_year}"
  #   seasonal_stats.sort_by do |a, b|
  #     a.yearid <=> b.yearid
  #   end

  # end

end