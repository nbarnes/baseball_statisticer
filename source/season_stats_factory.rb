require 'CSV'

class SeasonalStatsFactory

  def self.import_from_csv_file(file_name, verbose)
    stat_lines = []
    errors = []

    CSV.foreach(file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
      stat_line = row.to_hash

      if stat_line[:playerid].nil?
        puts "Nil playerid found, stat_line = #{stat_line}, pushing row to anomalous rows" if verbose
        errors.push({error: "Nil playerid",row: row})
      elsif stat_line[:yearid].nil?
        puts "Nil yearid found, stat_line = #{stat_line}, pushing row to anomalous rows" if verbose
        errors.push({error: "Nil yearid", row: row})
      elsif stat_line[:league] == nil
        stat_line[:league] = team_to_league(stat_line[:teamid])
      elsif stat_line.size != 14
        puts "Unusual number of data elements in stat_line, pushing row to anomalous rows" if verbose
        errors.push({error: "Unusual number of data elements", row: row})

      else
        puts "pushing #{stat_line}" if verbose
        stat_lines.push(stat_line)
      end
    end

    return {stat_lines: stat_lines, errors: errors}

  end



  def team_to_league(team_id)
  al_teams = ['NYA', 'BOS', 'BAL', 'TBR', 'TOR', 'DET', 'MIN', 'CLE', 'KCA', 'KCR', 'CHA', 'LAA', 'SEA', 'TEX', 'HOU']
  nl_teams = ['WAS', 'ATL', 'NYN', 'FLA', 'PHI', 'STL', 'PIT', 'CIN', 'CHN', 'MIL', 'LAD', 'SFG', 'ARI', 'COL']
    case team_id
      when al_teams.any? {team_id}
        return "AL"
      when NL_teams.any? {team_id}
        return "NL"
      else puts "Unrecognized teamid in PlayerFactor.team_to_league" if verbose
    end
  end

end
