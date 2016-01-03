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
    revealed = rand(3) while revealed == truth || revealed == guess
  end
  return revealed
end

# Simulation
score = { win: 0, fail: 0 }
samplesize = 1000
samplesize.times do
  occurrence = experiment
  puts occurrence
  score[occurrence] += 1
  sleep(0.001)
end

# Display
puts "#{score[:win]} wins and #{score[:fail]} fails !"
puts "By systematically choosing to change from your initial choice,"
puts "you obtain in this simulation a #{100 * score[:win].to_f / samplesize.to_f}% success rate !"
puts "Badass, huh ?!"
