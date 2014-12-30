# Experiment code

def experiment
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

## Simulation
score = {:win => 0, :fail => 0}

samplesize = 250

samplesize.times do
	occurrence = experiment
	score[occurrence] += 1
end

## Display
success_rate = score[:win].to_f / samplesize.to_f
puts "#{score[:win]} wins and #{score[:fail]} fails ! \nBy systematically choosing to change from your initial choice, you obtain in this simulation a #{success_rate}% success rate ! Badass, huh ?!"