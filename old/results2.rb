class Compare

  def initialize(secret, player_guess, starting_time)
    @secret = secret
    @player_guess = player_guess
    @starting_time = starting_time
    initial_check(player_guess, secret)
  end

  def initial_check(player_guess, secret)
  right_guesses = 0
  wrong_guesses = []
  array = player_guess.scan(/./)
    array.map do |letter|
      if letter[0] == secret[0]
        right_guesses += 1
      else
        wrong_guesses
      end
      end
  feedback(right_guesses, player_guess)
  end

  def feedback(right_guesses, player_guess)
    p "'#{player_guess.upcase}' has xx of the correct elements with #{right_guesses} in the correct positions."
  end

  def time_counter(starting_time, finishing_time)
    time_to_solve = finishing_time - starting_time
    minutes = (seconds/60).to_i
    seconds = (seconds%60).to_i
    end_of_game(minutes, seconds)
  end

  def end_of_game(minutes, seconds)
    p "Congratulations! You guessed the sequence #{secret} in #{x} guesses over 4 minutes, 22 seconds.
    Do you want to (p)lay again or (q)uit?"
    plaayer_input = gets.chomp.to_s
    if player_input ==
    elsif condition

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
