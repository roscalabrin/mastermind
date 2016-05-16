require 'pry'
class Compare

  def initialize(secret, player_guess, starting_time)
    @secret = secret
    @player_guess = player_guess
    @starting_time = starting_time
    compare_positions(player_guess, secret)
  end

  def compare_positions(player_guess, secret)
  # player_guess = "rgbh"
  # secret = ["r", "b", "b", "y"]
  right_positions = 0
  unmatched_guess = []
  unmatched_secret = secret
  guess_array = player_guess.split('')
  guess_array.each_with_index do |letter, i|
    if letter[0] == secret[i]
      binding.pry
      right_positions += 1
      unmatched_secret.delete(secret[i])
    else
      unmatched_guess << letter
    end
  end
  evaluate(right_positions, unmatched_guess, secret)
  end

  def evaluate(right_positions, unmatched_guess, secret)
    if right_positions = 4
    finishing_time = Time.now
    time_counter(starting_time, finishing_time, secret)
    else
      wrong_positions(right_positions, unmatched_guess, secret)
    end
  end

  def wrong_positions(unmatched_secret, unmatched_guess)
  # secret = ["c", "c"]
  # wrong_positions = ["b", "b"]
  messed_positions = 0
  wrong_positions.map do |guess|
    if secret.include?(guess[0])
      messed_positions += 1
    else
    end
  end
  end


  end
  def feedback(right_guesses, player_guess)
    p "'#{player_guess.upcase}' has #{wrong_positions} of the correct elements with #{right_positions} in the correct positions."
  end

  # def play_again - after winning
  # end

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
