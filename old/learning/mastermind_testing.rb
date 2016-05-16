# require_relative 'result'

class MastermindGame

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

  def generate_secret
    colors = ["r", "g", "b", "y"]
    secret = colors.shuffle!
    puts secret
  end

end

# attr_reader :code
#
# def initialize(code)
#   @code = code
# end

#Initial Screen#
puts "Welcome to MASTERMIND"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit? > "
player_input = gets.chomp

# master = MastermindGame.new("rggb")
#
# master.initial_choice(player_input)
#
# #Generate Secret#
#
# master.code

# Play.new(secret)
#
# class Play
#   def initialize(secret)
#     @secret = secret
#   end
#
#   def guess
#     puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess? >"
#     @player_guess = gets.chomp.to_a
#   end
#
#   def evaluate_guess
#   end
