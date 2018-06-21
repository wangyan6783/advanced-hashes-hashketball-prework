def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0, 
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30, 
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7          
        },
        "Brook Lopez" => {
          number: 11, 
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15            
        },
        "Mason Plumlee" => {
          number: 1, 
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5           
        },
        "Jason Terry" => {
          number: 31, 
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1           
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4, 
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2           
        },
        "Bismak Biyombo" => {
          number: 0, 
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10           
        },
        "DeSagna Diop" => {
          number: 2, 
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5           
        },
        "Ben Gordon" => {
          number: 8, 
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0            
        },
        "Brendan Haywood" => {
          number: 33, 
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12           
        }
      }
    }
  }
end

def num_points_scored(player_name)
  points = nil
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if player == player_name
        return player_data[:points]
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if player == player_name
        return player_data[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  }
end

def team_names
  game_hash.collect { |location, team_data|
    team_data[:team_name]
  }
end

def player_numbers(team_name)
  game_hash.each { |location, team_data|
    if team_data[:team_name] == team_name
      players = team_data[:players]
      return players.collect { |player, player_data|
        player_data[:number]
      }
    end
  }
end

def player_stats(player_name)
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if player == player_name
        return player_data
      end
    }
  }
end

def big_shoe_rebounds
  biggest = nil
  rebounds = nil
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      shoe_size = player_data[:shoe]
      if biggest == nil || biggest < shoe_size
        biggest = shoe_size
        rebounds = player_data[:rebounds]
      end
    }
  }
  return rebounds
end

def most_points_scored
  most_points = nil
  most_points_player = nil
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      points = player_data[:points]
      if most_points == nil || most_points < points
        most_points = points
        most_points_player = player
      end
    }
  }
  return most_points_player
end

def winning_team
  win_points = 0
  win_team = nil
  game_hash.each { |location, team_data|
    players = team_data[:players]
    sum = points_sum(players)
    if win_points < sum
      win_points = sum
      win_team = team_data[:team_name]
    end
  }
  win_team
end

def points_sum(players)
  sum = 0
  players.each { |player, player_data|
    sum += player_data[:points]
  }
  sum
end

def player_with_longest_name
  longest = 0
  name = nil
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if longest < player.length
        longest = player.length
        name = player
      end
    }
  }
  name
end

def long_name_steals
  long_name = player_with_longest_name
  long_name_steals = game_hash.each{ |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if player == long_name
        return player_data[:steals]
      end
    }
  }
end

def long_name_steals_a_ton?
  long_steals = long_name_steals
  game_hash.each { |location, team_data|
    players = team_data[:players]
    players.each { |player, player_data|
      if player_data[:steals] > long_steals
        return false
      end
    }
  }
  return true
end