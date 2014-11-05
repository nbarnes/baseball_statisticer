
def most_improved_batting_average(league, year1, year2)

  ba_deltas = []
  league.players.each do |player|
    if player.at_bats(2009) > 200 && player.at_bats(2010) > 200
      ba_comp = {}
      ba_comp[:player_name] = player.name
      ba_comp[:delta] = player.batting_average(2010) - player.batting_average(2009)
      ba_deltas.push(ba_comp)
    end
  end

  most_improved_ba = ba_deltas[0]

  ba_deltas.each do |ba_delta|
    if most_improved_ba[:delta] < ba_delta[:delta]
      most_improved_ba = ba_delta
    end
  end

  return most_improved_ba
end

def team_slugging(league, team, year)
  team_slugging = []
  league.players.each do |player|
    player.seasonal_stats.each do |stat_line|
      if stat_line.year == year && stat_line.team == 'OAK'
        player_entry = {}
        player_entry[:player_name] = player.name
        player_entry[:slugging] = stat_line.slugging
        team_slugging.push(player_entry)
      end
    end
  end
  return team_slugging
end

def batting_average_champion(league, al_nl_league, year)
  players = league.players

  top_batting_average = players.max_by do |player|
    hits, at_bats = 0, 0
    player.seasonal_stats.each do |stat_line|

      if stat_line.year == year && stat_line.league == al_nl_league && stat_line.at_bats >= 400
        hits += stat_line.hits
        at_bats += stat_line.at_bats
      end

    end

    if (at_bats != 0)
      (hits.to_f / at_bats)
    else
      0.0
    end

  end
  return top_batting_average
end

def home_run_champion(league, al_nl_league, year)
  players = league.players

  home_run_champ = players.max_by do |player|
    home_runs = 0
    player.seasonal_stats.each do |stat_line|

      if stat_line.year == year && stat_line.league == al_nl_league
        home_runs += stat_line.home_runs
      end

    end
    home_runs
  end
  return home_run_champ
end

def rbi_champion(league, al_nl_league, year)
  players = league.players
  rbi_champion = players.max_by do |player|
    rbis = 0
    player.seasonal_stats.each do |stat_line|
      if stat_line.year == year && stat_line.league == al_nl_league
        rbis += stat_line.runs_batted_in
      end
    end
    rbis
  end
  return rbi_champion
end

def triple_crown_winner(league, al_nl_league, year)
  batting_champ = batting_average_champion(league, al_nl_league, year)
  # puts "Batting champ for #{year}: #{batting_champ.name}"
  home_runs_champ = home_run_champion(league, al_nl_league, year)
  # puts "Home run champ for #{year}: #{home_runs_champ.name}"
  rbi_champ = rbi_champion(league, al_nl_league, year)
  # puts "RBI champ for #{year}: #{rbi_champ.name}"

  if (batting_champ.name == home_runs_champ.name) && (batting_champ.name == rbi_champ.name)
    return batting_champ
  else
    return nil
  end
end
