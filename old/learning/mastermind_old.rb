class MastermindGame
  def initialize(secret)
    @secret = secret
    puts secret
  end

  # def guess
  #   puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess? >"
  #   @player_guess = gets.chomp.to_a
  # end
  #
  # def evaluate_guess
  # end
end

def generate_secret
  colors = ["r", "g", "b", "y"]
  secret = colors.shuffle!
  MastermindGame.new(secret)
end

def initial_choice(player_input)
  if player_input == "p" || player_input == "play"
    generate_secret
  elsif player_input == "i" || player_input == "instructions"
    puts "Mastermind is a is a code-breaking game. The goal of the game is to guess a secret code consisting of a series of 4 colored pegs."
  elsif player_input == "q" || player_input == "quit"
    puts "Goodbye!"
  else
    puts "Invalid choice."
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
    player_input = gets.chomp
    initial_choice(player_input)
  end
end

#Initial Screen#
puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
player_input = gets.chomp

initial_choice(player_input)
#Initial Screen End#
