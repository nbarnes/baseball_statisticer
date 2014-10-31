require 'CSV'

class PlayerFactory

  def self.import_from_csv_file(file_name, verbose)
    players = []
    anomalous_rows = []

    CSV.foreach(file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
      player = row.to_hash

      if player[:playerid].nil?
        puts "Nil playerid found, player = #{player}, pushing row to anomalous rows" if verbose
        anomalous_rows.push("Nil playerid, row = #{player}")
      elsif player.size != 4
        puts "Unusual number of data elements in player, pushing row to anomalous rows" if verbose
        anomalous_rows.push("Unusual number of data elements in player, pushing row to anomalous rows")
        anomalous_rows.push("#{player}")
      elsif id_match?(player, players)
        puts "matching id found for player #{player}" if verbose
        anomalous_rows.push("matching id found for player #{player}")
      else
        puts "pushing #{player}" if verbose
        players.push(player)
      end
    end

    puts "Dumping anomalous data rows to player_data_anomalous_rows.txt" if verbose
    File.open("player_data_anomalous_rows.txt", "w") do |f|
      f.puts(anomalous_rows)
    end

    return players
  end

  def self.id_match?(player, players)
    players.any? do |each_player|
      player[:playerid] == each_player[:playerid]
    end
  end

end
