class Game
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
    unguessed_secret = []
    player_guess_array = player_guess.split('')
    player_guess_array.each do |letter|
      if letter[0] == @secret[i]
      right_positions += 1
      else
      unguessed_secret << @secret[i]
      end
      i += 1
    end
     evaluate(right_positions, unguessed_secret)
   end

  def evaluate(right_positions, unguessed_secret)
    if right_positions == 4
    finishing_time = Time.now
    time_counter(finishing_time)
    else
    end
    wrong_guess(right_positions, unguessed_secret)
  end

  # def counter
  #   guess_counter = 0
  #   while right_positions != 4
  #     guess_counter += 1
  #   end
  # end

  def wrong_guess(right_positions, unguessed_secret)
    wrong_guess = []
    i = 0
    player_guess_array = player_guess.split('')
    player_guess_array.select do |letter|
      if letter[0] != @secret[i]
      wrong_guess << letter[0]
      else
      end
      i += 1
      end
      wrong_positions(wrong_guess, right_positions, unguessed_secret)
    end

    def wrong_positions(wrong_guess, right_positions, unguessed_secret)
      uncorrect_positions = 0
      wrong_guess.map do |letter|
        if unguessed_secret.include?(letter[0])
          uncorrect_positions += 1
          unguessed_secret.delete(letter[0])
        end
        end
        sum = right_positions + uncorrect_positions
        feedback(right_positions, sum)
      end

    def feedback(right_positions, sum)
      p "'#{@player_guess.upcase}' has #{sum} of the correct elements with #{right_positions} in the correct positions. You've taken xx guess."
      guess_again
    end

    def guess_again
      p "Take another guess or type (c)heat to print out the secret and end the game. > "
      player_new_guess = gets.chomp.to_s.downcase
      if player_new_guess == "c" || player_new_guess == "cheat"
        p "The secret was #{@secret}."
        play_again_prompt
      elsif player_new_guess == "q" || player_new_guess == "quit"
        p "Goodbye!"
      else
        validate_guess(player_new_guess)
      end
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

    def time_counter(finishing_time)
      time_to_solve = finishing_time - @starting_time
      minutes = (time_to_solve/60).to_i
      seconds = (time_to_solve%60).to_i
      end_of_game(minutes, seconds)
    end

    def end_of_game(minutes, seconds)
      p "Congratulations! You guessed the sequence #{@secret} in x guesses over #{minutes} minutes, #{seconds} seconds."
      play_again_prompt
    end

    def exit_game
      p "Goodbye!"
    end

    def play_again_prompt
      p "Do you want to (p)lay again or (q)uit the game?"
      player_input = gets.chomp.to_s
      if player_input == "p" || player_input == "play"
        generate_secret
      elsif player_input == "q" || player_input == "quit"
        exit_game
      else
        p "Invalid choice. Do you want to (p)lay again or (q)uit"
        initial_choice_prompt
      end
    end

end
