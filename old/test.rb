secret = ["r", "g", "b", "y"]
player_guess = ("rgyb")
right_positions = 0
i = 0
wrong_indexes = []
player_guess_array = player_guess.split('')
player_guess_array.each do |letter|
  if letter[0] == secret[i]
  right_positions += 1
else
  wrong_indexes << secret[i]
  end
  i += 1
end
p right_positions






  secret = ["r", "g", "b", "y"]
  player_guess = ("rgyg")
  wrong_guess = []
  i = 0
  player_guess_array = player_guess.split('')
  player_guess_array.select do |letter|
    if letter[0] != secret[i]
    wrong_guess << letter[0]
    # wrong_positions += 1
    else
    end
    i += 1
    end

    p wrong_guess


wrong_guess = ["y", "y"]
uncorrect_position = 0
wrong_secret = ["g", "y"]
wrong_guess.map do |letter|
  if wrong_secret.include?(letter[0])
    uncorrect_position += 1
    wrong_secret.delete(letter[0])
  end
end
  p uncorrect_position

  def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
  end


def generate_secret(size)
sequence = ["r", "b", "g", "y"]
secret = Array.new(size) { test.sample }.join
secret
end

generate_secret(4)
