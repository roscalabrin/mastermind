require_relative 'results_new'

class Mastermind
  attr_reader :secret
  attr_reader :level

  def initialize(secret, level)
    @secret = secret
    @level = level
    initial_game_message(level)
  end

  def initial_game_message(level)
    if level == 4
      level_desc = "a beginner"
      level_number = "four"
      level_colors = "(r)ed, (g)reen, (b)lue, and (y)ellow"
    elsif level == 6
      level_desc = "an intermediate"
      level_number = "six"
      level_colors = "(r)ed, (g)reen, (b)lue, (y)ellow, and (p)urple"
    else
      level_desc = "an advanced"
      level_number =  "eight"
      level_colors = "(r)ed, (g)reen, (b)lue, (y)ellow, (p)urple, and (o)range"
    end
    p "I have generated #{level_desc} sequence with #{level_number} elements made up of: #{level_colors}."
    capture_player_guess
  end

# First Guess
  def capture_player_guess
  p "Use (q)uit at any time to end the game. What's your guess? >"
  player_guess = gets.chomp.to_s.downcase
  validate_player_first_guess(player_guess, level)
  end

  def validate_player_first_guess(player_guess, level)
    if player_guess.length == level
      starting_time = Time.now
      number_of_guesses = 1
      GuessAnalysis.new(secret, player_guess, starting_time, number_of_guesses, level)
    elsif player_guess == "q" || player_new_guess == "quit"
      exit_game
    else
      invalid_guess(player_guess, level)
    end
  end

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
    check_player_first_guess(player_guess, level)
  end

end

# Secret Sequence
def generate_secret(level)
  if level == 4
    sequence_beginner = ["r", "b", "g", "y"]
    secret = Array.new(level) { sequence_beginner.sample }.join
    Mastermind.new(secret, level)
  elsif level == 6
    sequence_intermediate = ["r", "b", "g", "y", "p"]
    secret = Array.new(level) { sequence_intermediate.sample }.join
    Mastermind.new(secret, level)
  else
    sequence_advanced = ["r", "b", "g", "y", "p", "o"]
    secret = Array.new(level) { sequence_advanced.sample }.join
    Mastermind.new(secret, level)
end

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
