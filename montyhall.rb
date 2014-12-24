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

	if new_answer - 1 == truth
		return :win
	else
		return :fail
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


############################

log_wins = []
log_fails = []

25.times do
	occurrence = experience 
	if occurrence == :win
		log_wins<<occurrence
	else
		log_fails<<occurrence
	end
end

puts log_wins
puts ""
puts log_fails

success_rate = log_wins.length.to_f / (log_wins.length + log_fails.length).to_f
puts "En utilisant la stratégie du changement de boîte, vous obtenez sur cette simulation un taux de succès de #{success_rate} ! Badass, huh ?!"