class GuessWordGame
  attr_reader :word, :max_attempts, :remaining_attempts, :masked_word, :guessed_letters

  def initialize(word, max_attempts = 5)
    word = word.downcase.gsub(/[^a-z]/, "")
    @word = word.chars.join(" ").freeze
    @max_attempts = max_attempts.freeze
    @remaining_attempts = max_attempts < 0 ? 0 : max_attempts 
    @masked_word = ("_" * word.length).chars.join(" ")
    @guessed_letters = []
  end

  def guess(letter)
    letter = letter[0].downcase
    if letter.match?(/[^a-z]/)
      @remaining_attempts -= 1
      "Invalid Guess!"
    elsif @guessed_letters.include?(letter)
      "Already Guessed!"
    elsif !@word.include?(letter)
      @remaining_attempts -= 1
      "Incorrect Guess!"
    else
      @word.chars.each_with_index{|char, index| masked_word[index] = char if char == letter}
      @guessed_letters.push(letter)
      "Correct Guess!"
    end
  end

  def won?
    !@masked_word.include?("_")
  end

  def lost?
    @remaining_attempts.zero?
  end

  def on?
    !won? && !lost?
  end

  def over?
    won? || lost?
  end

  def status
    if won?
      "Won"
    elsif lost?
      "Lost"
    else
      "Ongoing"
    end
  end
end