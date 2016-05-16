secret = ["r", "r", "y", "y"]
player_guess = ["r", "g", "r", "y"]

def initial_check
right_guesses = 0
wrong_guesses = []
  player_guess.each do |guess|
    if guess == secret[0]
      right_guesses += 1
    else
       print wrong_guesses << guess
    end
    end
end

def sum
  if right_guesses == 4
    puts "Congrats"
  else
    calculate_feedback
  end
end

def calculate_feedback
print wrong_guesses.length
end
