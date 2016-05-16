class GuessComparison
# attr_accessor :player_guess
#
#   def initialize(secret, player_guess, starting_time, number_of_guesses, level)
#     @secret = secret
#     @player_guess = player_guess
#     @starting_time = starting_time
#     @number_of_guesses = number_of_guesses
#     @level = level
#     correct_positions(player_guess)
#   end

  # def new_guess(player_new_guess)
  #   @player_guess = player_new_guess
  #   @number_of_guesses += 1
  #   correct_positions(player_guess)
  # # end
  #
  # # def correct_positions(player_guess)
  # #   correct_positions = 0
  # #   i = 0
  # #   unguessed_secret = []
  # #   player_guess_array = player_guess.split('')
  # #   player_guess_array.each do |letter|
  # #     if letter[0] == @secret[i]
  # #     correct_positions += 1
  # #     else
  # #     unguessed_secret << @secret[i]
  # #     end
  # #     i += 1
  # #   end
  # #    analyze_correct_positions(correct_positions, unguessed_secret)
  # #  end
  #
  # #  def analyze_correct_positions(correct_positions, unguessed_secret)
  # #   if correct_positions == @level
  # #     finishing_time = Time.now
  # #     time_counter(finishing_time)
  # #   else
  # #     correct_elements_wrong_positions_part_1(correct_positions, unguessed_secret)
  # #   end
  # # end
  #
  # def correct_elements_wrong_positions_part_1(correct_positions, unguessed_secret)
  #   wrong_guess = []
  #   i = 0
  #   player_guess_array = player_guess.split('')
  #   player_guess_array.select do |letter|
  #     if letter[0] != @secret[i]
  #     wrong_guess << letter[0]
  #     else
  #     end
  #     i += 1
  #     end
  #     correct_elements_wrong_positions_part_2(wrong_guess, correct_positions, unguessed_secret)
  #   end
  #
  #   def correct_elements_wrong_positions_part_2(wrong_guess, correct_positions, unguessed_secret)
  #     incorrect_positions = 0
  #     wrong_guess.map do |letter|
  #       if unguessed_secret.include?(letter[0])
  #         incorrect_positions += 1
  #         unguessed_secret.delete(letter[0])
  #       end
  #       end
  #       count_of_correct_letters = correct_positions + incorrect_positions
  #       feedback(correct_positions, count_of_correct_letters)
  #     end
  #
  #   def feedback(correct_positions, count_of_correct_letters)
  #     p "'#{@player_guess.upcase}' has #{count_of_correct_letters} of the correct elements with #{correct_positions} in the correct positions. You've taken #{@number_of_guesses} guess(es)."
  #     take_another_guess
  #   end

    def take_another_guess
      p "Take another guess or type (c)heat to print out the secret sequence and end the game. > "
      player_new_guess = gets.chomp.to_s.downcase
      if player_new_guess == "c" || player_new_guess == "cheat"
        cheat
      elsif player_new_guess == "q" || player_new_guess == "quit"
        exit_game
      else
        validate_new_guess(player_new_guess)
      end
    end

# reveals secret
    def cheat # reveals secret
      p "The secret sequence was '#{@secret.upcase}'."
      play_again_prompt
    end

    def validate_new_guess(player_new_guess)
      if player_new_guess == "q" || player_new_guess == "quit"
        exit_game
      elsif player_new_guess.length == @level
        new_guess(player_new_guess)
      elsif player_new_guess.length < @level
       p "Your guess is too short."
       try_again
     elsif player_new_guess.length > @level
        p "You guess is too long."
        try_again
      else
        invalid_guess_try_again
       end
      end

    def invalid_guess_try_again
      p "Invalid guess."
      p "Please try again using the #{@level} initial letters of your color sequence guess -> (r)ed, (g)reen, (b)lue, and (y)ellow."
      player_new_guess = gets.chomp.to_s
      new_guess(player_new_guess)
    end

    # def time_counter(finishing_time)
    #   time_to_solve = finishing_time - @starting_time
    #   minutes = (time_to_solve/60).to_i
    #   seconds = (time_to_solve%60).to_i
    #   end_of_game(minutes, seconds)
    # end
    #
    # def end_of_game(minutes, seconds)
    #   p "Congratulations! You guessed the sequence '#{@secret.upcase}' in #{@number_of_guesses} guesses over #{minutes} minutes, #{seconds} seconds."
    #   play_again_prompt
    # end
    #
    # def exit_game
    #   p "Goodbye!"
    # end
    #
    # def play_again_prompt
    #   p "Do you want to (p)lay again or (q)uit the game?"
    #   player_input = gets.chomp.to_s
    #   play_instructions_or_quit(player_input)
    # end

end
