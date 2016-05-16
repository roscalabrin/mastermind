require_relative 'results3'

class MastermindGame
  attr_reader :secret

  def initialize(secret)
    @secret = secret
    game_begins
  end

  def game_begins
    p "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess? >"
    player_guess = gets.chomp.to_s
    first_guess(player_guess)
  end

  def first_guess(player_guess)
      if player_guess.length == 4
        starting_time = Time.now
        Compare.new(secret, player_guess, starting_time)
      elsif player_guess == "q"
        p "Goodbye!"
      else
      invalid_guess
      end
  end

  def invalid_guess
    p "Invalid guess. Please try again. Using the 4 initial letters of your color sequence guess -> (r)ed, (g)reen, (b)lue, and (y)ellow."
    player_guess = gets.chomp.to_s
    evaluate_guess(player_guess)
  end

end

#Secret
def generate_secret
  colors = ["r", "g", "b", "y"]
  secret = colors.shuffle!
  MastermindGame.new(secret)
end

#Player's first choice
def initial_choice(player_input)
  if player_input == "p" || player_input == "play"
    generate_secret
  elsif player_input == "i" || player_input == "instructions"
    p "Mastermind is a is a code-breaking game. The goal of the game is to guess a secret code consisting of a series of 4 colors."
    initial_prompt
  elsif player_input == "q" || player_input == "quit"
    p "Goodbye!"
  else
    p "Invalid choice."
    initial_game_prompt
  end
end

def initial_game_prompt
  p "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
  player_input = gets.chomp
  initial_choice(player_input)
end

#Initial Screen#
puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
player_input = gets.chomp

initial_choice(player_input)
