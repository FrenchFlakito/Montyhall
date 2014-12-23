def experience

	disposition = ["rien", "rien", "voiture"].shuffle
	box_numbers = [0, 1, 2]
	truth = rand(3)
	guess = rand(3)

#	puts("Tu as choisi l\'option #{guess + 1}")
	revealed_box = reveal(truth, guess) + 1
#	puts("Maintenant, je te dis qu\'il n\'y avait rien dans la boîte #{revealed_box}")

	# stratégie "je change"
	new_answer = (box_numbers - [guess] - [revealed_box - 1])[0] + 1
#	puts("Tu changes de boîte ? Très bien, tu choisis donc désormais la boîte #{new_answer}.")

	if new_answer == truth
		puts "you win"
	else
		puts "Raté !"
	end

end

def reveal(truth, guess)   # à optimiser !!	
	revealed = rand(3)
	if truth == guess
		revealed = rand(3) while revealed == truth
	else
		revealed = rand(3) while (revealed == truth or revealed == guess)
	end
	return revealed
end

20.times do experience end