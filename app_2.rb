require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

enemies = []
enemie1 = Player.new("Josianne") # A ma droite, JOSIANNE !!!
enemie2 = Player.new("José") # A ma gauche, JOSÉ !!!
enemies << enemie1
enemies << enemie2

puts "\n ----================================="
puts "       | 'ILS VEULENT TOUS MA POO'  |"
puts "       |   Let's begin the game !   |"
puts "      =================================----\n\n"
puts " Quel est ton nom gladiateur ?"
print ">"
player_name = gets.chomp
if player_name.size > 10
	puts " Trop longt, fait plus court !\nDe toute façon, ça va être rapide..."
	print "> "
	player_name = gets.chomp
elsif player_name.size < 1
	player_name = "Le Vengeur Masquey"
end
player1 = HumanPlayer.new(player_name)
puts " Bienvenue #{player_name}, que le combat commence !"
puts "------------------------------------------------------------"

while player1.life_points > 0 && (enemie1.life_points > 0 || enemie2.life_points > 0) #Jusqu'a la mort
	gets.chomp
	puts player1.show_state
	puts " Que veux tu faire ?\n\n"
	puts " Chercher à l'aveugle :"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner\n\n"
	puts " Attaquer un enemie en vue :"
	puts "0 - #{enemie1.show_state}"
	puts "1 - #{enemie2.show_state}\n\n"
	print "> "
	action = gets.chomp.to_s.downcase
	puts "#=======================================================#"
	if action == "a"                                  #Conditions d'interactions
		player1.search_weapon
	elsif action == "s"
		player1.search_health_pack
	elsif action == "0"
		if enemie1.life_points <= 0
			puts " Cet ennemie est déja mort !"       #Tanpis pour toi
		else
			player1.attacks(enemie1)
		end
	elsif action == "1"
		if enemie2.life_points <= 0
			puts " Cet ennemie est déja mort !"       #Tanpis pour toi
		else
			player1.attacks(enemie2)
		end
	else
		puts " Dépeche-toi, fait quelque-chose !"     #Tanpis pour toi
	end
	puts "#=======================================================#"
	break if player1.life_points <=0 || enemie1.life_points <= 0 && enemie2.life_points <= 0 # Si un des deux tombe..
	puts "\n Les ennemies attaquent !!"
	enemies.each do |enemie|
		if enemie.life_points  <= 0  #Mode Zombies ?
		else
		gets.chomp
		puts " =========================================="
		enemie.attacks(player1)
		puts " =========================================="
		end
	end
	puts
end

if player1.life_points > 0
	puts "\n\n==========================================================="
	puts "|  Félicitaions Gladiateur, a toi la coke et les putes !  |"
	puts "===========================================================\n\n"
else
	puts "\n\n==========================================================="
	puts "|  Encore un Gladiateur qui n'aura servie à rien...       |"
	puts "===========================================================\n\n"
end