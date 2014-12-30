# Simulation code

def experience
	@box_numbers = [0, 1, 2]
	truth = rand(3)
	guess = rand(3)

	clue = reveal(truth, guess)
	new_answer = (@box_numbers - [guess] - [clue])[0]

	if new_answer == truth
		return :win
	else
		return :fail
	end
end

def reveal(truth, guess)
	revealed = 0
	if truth == guess
		revealed = rand(3) while revealed == truth
	else
		revealed = rand(3) while (revealed == truth or revealed == guess)
	end
	return revealed
end


# Visualization

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