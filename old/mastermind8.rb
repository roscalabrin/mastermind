require_relative 'results8'

class MastermindGame
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
    elsif level == 6
      level_desc = "an intermediate"
      level_number = "six"
    else
      level_desc = "an advanced"
      level_number =  "eight"
    end
    p "I have generated #{level_desc} sequence with #{level_number} elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
    capture_player_guess
  end

  def capture_player_guess
  p "Use (q)uit at any time to end the game. What's your guess? >"
  player_guess = gets.chomp.to_s.downcase
  check_player_first_guess(player_guess, level)
  end

  def check_player_first_guess(player_guess, level)
    if player_guess.length == level
      validate_first_guess(player_guess, level)
    elsif player_guess == "q" || player_guess == "quit"
      exit_game
    else
      invalid_guess(player_guess, level)
    end
  end

  def validate_first_guess(player_guess, level)
    if player_guess.length == level
      starting_time = Time.now
      number_of_guesses = 1
      Game_Analysis.new(secret, player_guess, starting_time, number_of_guesses, level)
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

# secret sequence is generated and a new game begins
def generate_secret(level)
  sequence = ["r", "b", "g", "y"]
  secret = Array.new(level) { sequence.sample }.join
  MastermindGame.new(secret, level)
end

# player selects game level
def level_choice
  p "Choose your level: (b)beginner, (i)ntermediate, (a)dvanced >"
  player_level = gets.chomp.to_s.downcase
  if player_level == "b" || player_level == "beginner"
    level = 4
    generate_secret(level)
  elsif player_level == "i" || player_level == "intermediate"
    level = 6
    generate_secret(level)
  elsif player_level == "a" || player_level == "advanced"
    level = 8
    generate_secret(level)
  else
    p "Invalid choice."
    level_choice
  end
end

# player's input: play, instructions or quit
def play_instructions_or_quit(player_input)
  if player_input == "p" || player_input == "play"
    level_choice
  elsif player_input == "i" || player_input == "instructions"
    instructions
  elsif player_input == "q" || player_input == "quit"
    exit_game
  else
    invalid_choice
  end
end

# general messages to player
def invalid_choice
p "Invalid choice. Please try again."
initial_prompt
end

def instructions
  p "Mastermind is a is a code-breaking game. The goal of the game is to guess a secret code consisting of a series of 4 colors."
  initial_prompt
end

def exit_game
  p "Goodbye!"
end

def initial_prompt
  p "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
  player_input = gets.chomp
  play_instructions_or_quit(player_input)
end

# initial screen#
puts "Welcome to MASTERMIND"
initial_prompt
