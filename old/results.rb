class Compare

  def initialize(player_guess)
    @player_guess = player_guess
    initial_check(player_guess)
  end

def initial_check(player_guess)
right_guesses = 0
wrong_guesses = []
array = player_guess.scan(/./)
  array.map do |letter|
    if letter[0] == $secret[0]
      right_guesses += 1
    else
      wrong_guesses
    end
    end
feedback(right_guesses, player_guess)
end

def feedback(right_guesses, player_guess)
p "'#{player_guess.upcase}' has with #{right_guesses} in the correct positions."
end

end

# initial_check("rrby")
#
#
#
# def game_timer(starting_time, finishing_time)
#   seconds = finishing_time - starting_time
#   minutes = (seconds/60).to_i
#   seconds = (seconds%60).to_i
#   time = "You finishded in #{minutes} minutes and #{seconds} seconds."
# end
