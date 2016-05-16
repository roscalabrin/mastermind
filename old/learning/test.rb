colors = ["r", "g", "b", "y"]
secret = colors.shuffle!

secret = ["r", "r", "y", "y"]
player_guess = ["r", "g", "r", "y"]

player_guess.map do |guess|
  if guess == secret[0]
    puts "right"
  else
    puts "wrong"
  end
end
