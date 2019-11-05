def game_hash
  {
    :home => {
      :team_name=> "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" =>{
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans"=> {
          :number=> 30,
          :shoe=> 14 ,
          :points=> 12,
          :rebounds=>12,
          :assists=>12,
          :steals=> 12,
          :blocks=> 12,
          :slam_dunks =>7
        },
        "Brook Lopez"=> {
          :number=> 11,
          :shoe=> 17,
          :points=> 17,
          :rebounds=>19,
          :assists=>10,
          :steals=> 3,
          :blocks=> 1,
          :slam_dunks =>15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe=>19,
          :points=>26,
          :rebounds=>11,
          :assists=>6,
          :steals=>3,
          :blocks=>8,
          :slam_dunks=>5
        },
        "Jason Terry"=> {
          :number => 31,
          :shoe=>15,
          :points=>19,
          :rebounds=>2,
          :assists=>2,
          :steals=>4,
          :blocks=>11,
          :slam_dunks=>1

        }
      }
    },

      :away=> {
      :team_name =>"Charlotte Hornets",
      :colors=> ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien"=> {
        :number => 4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2
     },
       "Bismack Biyombo"=> {
         :number => 0,
         :shoe=>16,
         :points=>12,
         :rebounds=>4,
         :assists=>7,
         :steals=>22,
         :blocks=>15,
         :slam_dunks=>10
       },
       "DeSagna Diop"=> {
       :number => 2,
       :shoe=>14,
       :points=>24,
       :rebounds=>12,
       :assists=>12,
       :steals=>4,
       :blocks=>5,
       :slam_dunks=>5
     },
    "Ben Gordon"=> {
     :number => 8,
     :shoe=>15,
     :points=>33,
     :rebounds=>3,
     :assists=>2,
     :steals=>1,
     :blocks=>1,
     :slam_dunks=>0
   },
   "Kemba Walker"=> {
     :number => 33,
     :shoe=>15,
     :points=>6,
     :rebounds=>12,
     :assists=>12,
     :steals=>7,
     :blocks=>5,
     :slam_dunks=>12
         }
      }
   }
}
end

def num_points_scored(name)
   game_hash.each do |place, team_info|
      team_info[:players].each do |player_name, info|
         if player_name == name
            return info[:points]
       end
    end
  end
end

def shoe_size(name)
  game_hash.each do |place, team_info|
     team_info[:players].each do |player_name, info|
        if player_name == name
           return info[:shoe]
        end
      end
  end
end

def team_colors(name)
  game_hash.each do |location,team_info|
    if team_info[:team_name] ==name
      return team_info[:colors]
      end
    end
  end

def team_names
  game_hash.map do |location,team|
   team[:team_name]
  end
end

def player_numbers(name_of_team)
  array = []
  game_hash.each do |team, location|
    if name_of_team == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, info|
        array.push(info[:number])
   end
    end
  end
  return array

end


def player_stats(name)
  game_hash.each do |location,team_info|
    team_info[:players].each do |player_name,player_info|
      if player_name== name
        return player_info
    end
  end
  end
end


def big_shoe_rebounds
  shoe_size=0
   rebound=0
   game_hash.each do |location,team_info|
    team_info[:players].each do |player_name,player_info|
     if player_info[:shoe]> shoe_size
    shoe_size= player_info[:shoe]
    rebound= player_info[:rebounds]
    end
  end
end
  rebound
end


def most_points_scored
  most_point=0
   player= nil
    game_hash.each do |location,team_info|
  team_info[:players].each do |player_name,player_info|
      if player_info[:points]>most_point
        most_point= player_info[:points]
        player= player_name
      end
   end
 end
 player
end

def winning_team
  home_team = 0
 away_team = 0
 game_hash[:home][:players].each do |player_name, player_info|
   home_team += player_info[:points]
 end
 game_hash[:away][:players].each do |player_name, player_info|
  away_team += player_info[:points]
 end
 if home_team > away_team
    game_hash[:home][:team_name]
 else
     game_hash[:away][:team_name]

 end
end


def player_with_longest_name
  longest=0
  name=nil
  game_hash.each do |location, team_info|
    team_info[:players].each do |player_name, player_info|
      if player_name.size>longest
    name=player_name
      longest=player_name.size
      end
    end
  end
  name

  end


  def long_name_steals_a_ton?
  name_with_steal = nil
  steal_number = 0
  game_hash.each do |location, team_info|
  team_info[:players].each do |player_name, player_info|
      if player_info[:steals] > steal_number
        steal_number = player_info[:steals]
        name_with_steal = player_name
      end
    end
  end
  name_with_steal == player_with_longest_name
end
