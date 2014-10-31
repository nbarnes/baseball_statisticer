
class Player

  attr_reader :player_id, :birth_year, :first_name, :last_name, :seasonal_stats

  def initialize(player_hash)
    @player_id = player_hash[:playerid]
    @birth_year = player_hash[:birthyear]
    @first_name = player_hash[:namefirst]
    @last_name = player_hash[:namelast]
  end

  def add_seasonal_stats
  end

  def to_s
    return "#{@player_id}, #{@first_name} #{@last_name}, #{@birth_year}"
  end

end