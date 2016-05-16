class Mastermind
  attr_accessor :player_guess
  attr_reader   :secret
  attr_reader   :level

  def initialize(secret, player_guess, starting_time, number_of_guesses, level)
    @secret = secret
    @level = level
    @player_guess = player_guess
    @starting_time = starting_time
    @number_of_guesses = number_of_guesses
    initial_game_message(level)
  end

  def new_guess(player_new_guess)
    @player_guess = player_new_guess
    @number_of_guesses += 1
    correct_positions(player_guess)
  end

# Comparison - player's guess and secret sequence
  def correct_positions(player_guess)
    correct_positions = 0
    i = 0
    unguessed_secret = []
    player_guess_array = player_guess.split('')
    player_guess_array.each do |letter|
      if letter[0] == @secret[i]
      correct_positions += 1
      else
      unguessed_secret << @secret[i]
      end
      i += 1
    end
     analyze_correct_positions(correct_positions, unguessed_secret)
   end

  def analyze_correct_positions(correct_positions, unguessed_secret)
    if correct_positions == @level
    finishing_time = Time.now
    time_counter(finishing_time)
    else
    correct_elements_wrong_positions_part_1(correct_positions, unguessed_secret)
    end
  end

  def correct_elements_wrong_positions_part_1(correct_positions, unguessed_secret)
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
      correct_elements_wrong_positions_part_2(wrong_guess, correct_positions, unguessed_secret)
    end

    def correct_elements_wrong_positions_part_2(wrong_guess, correct_positions, unguessed_secret)
      incorrect_positions = 0
      wrong_guess.map do |letter|
        if unguessed_secret.include?(letter[0])
          incorrect_positions += 1
          unguessed_secret.delete(letter[0])
        end
        end
        count_of_correct_letters = correct_positions + incorrect_positions
        feedback(correct_positions, count_of_correct_letters)
      end

# -------End of Game-------
    def time_counter(finishing_time)
      time_to_solve = finishing_time - @starting_time
      minutes = (time_to_solve/60).to_i
      seconds = (time_to_solve%60).to_i
      end_of_game(minutes, seconds)
    end

    def end_of_game(minutes, seconds)
      p "Congratulations! You guessed the sequence '#{@secret.upcase}' in #{@number_of_guesses} guesses over #{minutes} minutes, #{seconds} seconds."
      play_again_prompt
    end

    def exit_game
      p "Goodbye!"
    end

    def play_again_prompt
      p "Do you want to (p)lay again or (q)uit the game?"
      player_input = gets.chomp.to_s
      play_instructions_or_quit(player_input)
    end

# -------Feedback-------
    def feedback(correct_positions, count_of_correct_letters)
      p "'#{@player_guess.upcase}' has #{count_of_correct_letters} of the correct elements with #{correct_positions} in the correct positions. You've taken #{@number_of_guesses} guess(es)."
      take_another_guess
    end

# -------More Guesses-------
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



end

----------

def invalid_guess(player_guess, level)
  if player_guess.length < level
   p "Your guess is too short."
 elsif player_guess.length > level
  p "You guess is too long."
 else
  p "Invalid guess."
 end
  p "Please try again using the #{level} initial letters of your color sequence guess -> (r)ed, (g)reen, (b)lue, and (y)ellow."
  player_guess = gets.chomp.to_s
  validate_player_first_guess(player_guess, level)
end

def validate_player_first_guess(player_guess, level)
  if player_guess.length == level
    starting_time = Time.now
    number_of_guesses = 1
    Mastermind.new(secret, player_guess, starting_time, number_of_guesses, level)
  elsif player_guess == "q" || player_new_guess == "quit"
    exit_game
  else
    invalid_guess(player_guess, level)
  end
end

def capture_player_first_guess
  p "Use (q)uit at any time to end the game. What's your guess? >"
  player_guess = gets.chomp.to_s.downcase
  validate_player_first_guess(player_guess, level)
end

def initial_game_message(secret,level)
  if level == 4
    level_desc = "a beginner"
    level_number = "four"
  elsif level == 6
    level_desc = "an intermediate"
    level_number = "six"
  else
    level_desc = "an advanced"
    level_number =  "eight"
  end
  p "I have generated #{level_desc} sequence with #{level_number} elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
  capture_player_first_guess
end

# Secret Sequence
def generate_secret(level)
  sequence = ["r", "b", "g", "y"]
  secret = Array.new(level) { sequence.sample }.join
  initial_game_message(secret, level)
end

# Game Levels
def level_choice_prompt
  p "Choose your level: (b)beginner, (i)ntermediate, (a)dvanced >"
  player_level = gets.chomp.to_s.downcase
  level_choice_sort(player_level)
end

def level_choice_sort(player_level)
  if player_level == "b" || player_level == "beginner"
    level = 4
    generate_secret(level)
  elsif player_level == "i" || player_level == "intermediate"
    level = 6
    generate_secret(level)
  elsif player_level == "a" || player_level == "advanced"
    level = 8
    generate_secret(level)
  elsif player_level == "q" || player_level == "quit"
    exit_game
  else
    p "Invalid choice."
    level_choice_prompt
  end
end

def invalid_choice
  p "Invalid choice. Please try again."
  initial_prompt
  end

def instructions
  p "Mastermind is a is a code-breaking game. The goal of the game is to guess a secret code consisting of a series of 4, 6 or 8 colors."
  initial_prompt
end

def exit_game
  p "Goodbye!"
end

def play_instructions_or_quit(player_input)
  if player_input == "p" || player_input == "play"
    level_choice_prompt
  elsif player_input == "i" || player_input == "instructions"
    instructions
  elsif player_input == "q" || player_input == "quit"
    exit_game
  else
    invalid_choice
  end
end

def initial_prompt
  p "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
  player_input = gets.chomp.to_s.downcase
  play_instructions_or_quit(player_input)
end

# Initial Screen
p "Welcome to MASTERMIND"
initial_prompt
