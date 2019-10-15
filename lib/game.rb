class Game
  attr_accessor :human_player, :enemies

  	def initialize(name = "Wolverine", number_of_player = 4)
  		@enemies = []
  	  	number_of_player.times do |count|
   			new_enemies = Player.new("player#{count+1}")
   			@enemies << new_enemies
  		end
  	end

  	def kill_player(player)
  		@enemies.delete(player)
  	end

  	def is_still_ongoing?
  		if @human_player.life_points > 0 && @enemies.life_points > 0
  			return true
  		else
  			return false
  		end
  	end
end
