require "./lib/game.rb"

WORDS = ["Apple", "Banana", "Mango", "Orange", "Strawberry", "Grape"].freeze

# pick the random word 
word = WORDS.sample
max_attempts = 5

# initialize the game
puts "\n" + "-" * 20 + " Guess The Word " + "-" * 20, ""
game = GuessWordGame.new(word, max_attempts)
puts "Word: #{game.masked_word}" + " | " + "Remaining Attempts: #{game.remaining_attempts}", ""

# start the game
while game.on? do  
  print "Enter Guess: "
  letter = gets

  puts game.guess(letter), ""
  puts "Word: #{game.masked_word}" + " | " + "Remaining Attempts: #{game.remaining_attempts}", ""
end

# display the result
puts "Result: #{game.status}", ""
puts "-" * 20 + " END " + "-" * 20, ""