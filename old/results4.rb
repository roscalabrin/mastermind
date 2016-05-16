
class Guess
attr_accessor :player_guess

  def initialize(secret, player_guess, starting_time)
    @secret = secret
    @player_guess = player_guess
    @starting_time = starting_time
    equal_positions(player_guess)
  end

  def new_guess(player_new_guess)
    @player_guess = player_new_guess
    equal_positions(player_guess)
  end

  def equal_positions(player_guess)
    right_positions = 0
    i = 0
    player_guess_array = player_guess.split('')
    player_guess_array.each do |letter|
      if letter[0] == @secret[i]
      right_positions += 1
      else
      end
      i += 1
    end
    evaluate(right_positions)
  end

  def evaluate(right_positions)
    if right_positions == 4
    finishing_time = Time.now
    time_counter(starting_time, finishing_time, secret)
    else
    end
    wrong_positions(right_positions)
  end

  # def counter
  #   guess_counter = 0
  #   while right_positions != 4
  #     guess_counter += 1
  #   end
  # end

  def wrong_positions(right_positions)
    wrong_positions = 0
    i = 0
    player_guess_array = @player_guess.split('')
    player_guess_array.each do |letter|
      if letter[0] != @secret[i] && @secret.include?(letter[0])
      wrong_positions += 1
      else
      end
      i += 1
      end
      sum = right_positions + wrong_positions
      feedback(right_positions, sum)
    end

  def feedback(right_positions, sum)
    p "'#{@player_guess.upcase}' has #{sum} of the correct elements with #{right_positions} in the correct positions. You've taken xx guess."
    guess_again
  end

  def guess_again
    p "Take another guess or type (c)heat to print out the secret and end the game. > "
    player_new_guess = gets.chomp.to_s.downcase
    validate_guess(player_new_guess)
  end

  def validate_guess(player_new_guess)
    if player_new_guess == "q" || player_new_guess == "quit"
      p "Goodbye!"
    elsif player_new_guess.length == 4
      new_guess(player_new_guess)
    elsif player_new_guess.length < 4
     p "Your guess is too short."
   elsif player_new_guess.length > 4
      p "You guess is too long."
    else
      p "Invalid guess."
     end
      p "Please try again using the 4 initial letters of your color sequence guess -> (r)ed, (g)reen, (b)lue, and (y)ellow."
      player_new_guess = gets.chomp.to_s
      new_guess(player_new_guess)
    end

    def time_counter(starting_time, finishing_time)
      time_to_solve = finishing_time - starting_time
      minutes = (seconds/60).to_i
      seconds = (seconds%60).to_i
      end_of_game(minutes, seconds)
    end

    def end_of_game(minutes, seconds)
      p "Congratulations! You guessed the sequence #{secret} in #{x} guesses over #{minutes} minutes, #{seconds} seconds.
      Do you want to (p)lay again or (q)uit?"
      player_input = gets.chomp.to_s
      first_guess(player_guess)
    end
end
