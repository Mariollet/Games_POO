class Player #Nouvelle classe (Joueurs)
 attr_accessor :player_name, :life_points

 	def initialize(player_name, life_points = 10) #Nouvelle Instance (joueur)
 		@player_name = player_name.to_s
 		@life_points = life_points.to_i
 	end

 	def show_state # Stats
 		if @life_points < 0 
 			@life_points = 0
 		end
 		" #{self.player_name} a #{self.life_points} points de vie"
 	end

 	def gets_damage(damage_number) #Dégats
 		self.life_points -= damage_number.to_i
 		puts " Il lui inflige #{damage_number} points de dommages"
 		if self.life_points <= 0
 			puts " Le joueur #{self.player_name} à été tué !"
 		end
 	end

 	def attacks(player) #Attaque
 		puts " #{self.player_name} attaque #{player.player_name} !"
 		player.gets_damage(compute_damage)
 	end

  	def compute_damage #Random Dégats
    	return rand(1..6)
  	end
end

class HumanPlayer < Player #Class HumanPlayer avc les attribut de Player
 attr_accessor :weapon_level

 	def initialize(player_name, life_points = 100, weapon_level = 1)
 		@weapon_level = weapon_level.to_i
 		super(player_name, life_points)
 	end

 	def show_state
 		super + " et arme de niveau #{weapon_level}"
 	end

  	def compute_damage
    	super * @weapon_level
  	end

  	def search_weapon #chercher une arme random
  		new_weapon_level = rand(1..6)
  		puts " Tu as trouvé une arme de niveau #{new_weapon_level}"
  		if new_weapon_level > self.weapon_level
  			puts " Youhou ! elle est meilleure que ton arme actuelle de niveau #{weapon_level} tu la prends."
  			self.weapon_level = new_weapon_level
  		else
  			puts " M@*#$... elle n'est pas mieux que ton arme actuelle..."
  		end
  	end

  	def search_health_pack #chercher du soins ramdom
  		new_health = rand(1..6)
  		if new_health == 1
  			puts " Tu n'as rien trouvé..."
  		elsif new_health == 6
  			self.life_points += 80
  			if self.life_points > 100
  				self.life_points = 100
  			end
  			puts " Waow, tu as trouvé un pack de +80 points de vie !"
  		else
  			self.life_points += 50
  			if self.life_points > 100
  				self.life_points = 100
  			end
  			puts " Waow, tu as trouvé un pack de +50 points de vie !"
  		end
  	end
end
