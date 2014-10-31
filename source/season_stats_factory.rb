require 'CSV'

class SeasonalStatsFactory

  def self.import_from_csv_file(file_name, verbose)
    stat_lines = []
    anomalous_rows = []

    CSV.foreach(file_name, :headers => true, :header_converters => :symbol, :converters => :all, :skip_blanks => :true) do |row|
      stat_line = row.to_hash

      if stat_line[:playerid].nil?
        puts "Nil playerid found, stat_line = #{stat_line}, pushing row to anomalous rows" if verbose
        anomalous_rows.push("Nil playerid, row = #{stat_line}")
      elsif stat_line[:yearid].nil?
        puts "Nil yearid found, stat_line = #{stat_line}, pushing row to anomalous rows" if verbose
        anomalous_rows.push("Nil playerid, row = #{stat_line}")
      elsif stat_line.size != 14
        puts "Unusual number of data elements in stat_line, pushing row to anomalous rows" if verbose
        anomalous_rows.push("Unusual number of data elements in stat_line, pushing row to anomalous rows")
        anomalous_rows.push("#{stat_line}")
      else
        puts "pushing #{stat_line}" if verbose
        stat_lines.push(stat_line)
      end
    end

    File.open("stats_data_anomalous_rows.txt", "w") do |f|
      f.puts(anomalous_rows)
    end

  end

end
