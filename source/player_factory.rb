require 'CSV'

class PlayerFactory

  def self.import_from_csv_file(file_name, verbose)
    players = []
    errors = []

    CSV.foreach(file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
      player = row.to_hash

      if player[:playerid].nil?
        puts "Nil playerid found in row #{row}" if verbose
        errors.push({error: "Nil playerid", row: row})
      elsif player.size != 4
        puts "Unusual number of data elements in row #{row}" if verbose
        errors.push({error: "Unusual number of data elements", row: row})
      elsif id_match?(player, players)
        puts "matching id found for row #{row}" if verbose
        errors.push({error: "More than one row with ID", row: row})
      else
        puts "pushing #{player}" if verbose
        players.push(player)
      end
    end

    return {players: players, errors: errors}
  end

  def self.id_match?(player, players)
    players.any? do |each_player|
      player[:playerid] == each_player[:playerid]
    end
  end

end
