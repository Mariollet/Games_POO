require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josianne") # A ma droite, JOSIANNE !!!
player2 = Player.new("José") # A ma gauche, JOSÉ !!!

while player1.life_points > 0 && player2.life_points > 0 #Jusqu'a la mort  
	puts
	puts "Voici l'état de chaque joueur :\n\n"
	print "> "
	puts player1.show_state
	print "> " 
	puts player2.show_state
	puts
	puts "Passons à la phase d'attaque :"
	gets
 	puts " =========================================="
	player1.attacks(player2)
	break if player2.life_points <=0 # Si un des deux tombe..
	player2.attacks(player1)
 	puts " =========================================="
	gets
end
if player1.life_points > 0
	puts "\n Victoire de #{player1.player_name} !\n\n"
else
	puts "\n Victoire de #{player2.player_name} !\n\n"
end