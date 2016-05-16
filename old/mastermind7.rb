require_relative 'results7'

class MastermindGame
  attr_reader :secret

  def initialize(secret)
    @secret = secret
    game_begins
  end

  def game_begins
    p "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess? >"
    player_guess = gets.chomp.to_s.downcase
    check_player_first_guess(player_guess)
  end

  def check_player_first_guess(player_guess)
      if player_guess.length == 4
        starting_time = Time.now
        number_of_guesses = 1
        Game_Analysis.new(secret, player_guess, starting_time, number_of_guesses)
      elsif player_guess == "q"
        exit_game
      else
      invalid_guess(player_guess)
      end
    end

  def invalid_guess(player_guess)
    if player_guess.length < 4
     p "Your guess is too short."
   elsif player_guess.length > 4
    p "You guess is too long."
   else
    p "Invalid guess."
   end
    p "Please try again using the 4 initial letters of your color sequence guess -> (r)ed, (g)reen, (b)lue, and (y)ellow."
    player_guess = gets.chomp.to_s
    check_player_first_guess(player_guess)
  end

end

# generates secret and starts the game
def generate_secret
  colors = ["r", "g", "b", "y"]
  secret = colors.shuffle!
  MastermindGame.new(secret)
end

# player's first choice
def initial_choice(player_input)
  if player_input == "p" || player_input == "play"
    generate_secret
  elsif player_input == "i" || player_input == "instructions"
    p "Mastermind is a is a code-breaking game. The goal of the game is to guess a secret code consisting of a series of 4 colors."
    initial_prompt
  elsif player_input == "q" || player_input == "quit"
    exit_game
  else
    p "Invalid choice."
    initial_prompt
  end
end

# common used methods
def exit_game
  p "Goodbye!"
end

def initial_prompt
  p "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
  player_input = gets.chomp
  initial_choice(player_input)
end

# initial screen#
puts "Welcome to MASTERMIND"
initial_prompt
