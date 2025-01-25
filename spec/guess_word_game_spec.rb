require_relative "../lib/guess_word_game.rb"

describe GuessWordGame do
  context "game setup" do
    it "Test 1 : max attempts not given" do
      game = GuessWordGame.new("mango")
      expect("Word: #{game.word}").to eql("Word: m a n g o")
      expect("Remaining Attempts: #{game.remaining_attempts}").to eql("Remaining Attempts: 5")
    end

    it "Test 2 : word has capitalized letters" do
      game = GuessWordGame.new("MaNgo")
      expect("Word: #{game.word}").to eql("Word: m a n g o")
      expect("Remaining Attempts: #{game.remaining_attempts}").to eql("Remaining Attempts: 5")
    end

    it "Test 3 : word has numbers, spaces and special characters" do
      game = GuessWordGame.new("ma1 n$go")
      expect("Word: #{game.word}").to eql("Word: m a n g o")
      expect("Remaining Attempts: #{game.remaining_attempts}").to eql("Remaining Attempts: 5")
    end

    it "Test 4 : max attempts given" do
      game = GuessWordGame.new("mango", 3)
      expect("Word: #{game.word}").to eql("Word: m a n g o")
      expect("Remaining Attempts: #{game.remaining_attempts}").to eql("Remaining Attempts: 3")
    end

    it "Test 5 : max attempts negative" do
      game = GuessWordGame.new("mango", -3)
      expect("Word: #{game.word}").to eql("Word: m a n g o")
      expect("Remaining Attempts: #{game.remaining_attempts}").to eql("Remaining Attempts: 0")
    end
  end

  context "guess letter" do
    before(:each) do
      @game = GuessWordGame.new("mango", 3)
    end

    it "Test 6 : entered correct letter" do
      result = @game.guess("m")
      expect(result).to eql("Correct Guess!")
      expect("Word: #{@game.masked_word}").to eql("Word: m _ _ _ _")
    end

    it "Test 6 : already guessed letter" do
      @game.guess("m")
      result = @game.guess("m")
      expect(result).to eql("Already Guessed!")
      expect("Word: #{@game.masked_word}").to eql("Word: m _ _ _ _")
    end

    it "Test 8 : entered letter in capital" do
      result = @game.guess("M")
      expect(result).to eql("Correct Guess!")
      expect("Word: #{@game.masked_word}").to eql("Word: m _ _ _ _")
    end

    it "Test 9 : entered incorrect letter" do
      result = @game.guess("y")
      expect(result).to eql("Incorrect Guess!")
      expect("Word: #{@game.masked_word}").to eql("Word: _ _ _ _ _")
    end

    it "Test 10 : entered invalid letter" do
      result = @game.guess("$")
      expect(result).to eql("Invalid Guess!")
      expect("Word: #{@game.masked_word}").to eql("Word: _ _ _ _ _")
    end

    it "Test 11 : entered more than one letters" do
      result = @game.guess("mgo")
      expect(result).to eql("Correct Guess!")
      expect("Word: #{@game.masked_word}").to eql("Word: m _ _ _ _")
    end
  end

  context "game on" do
    before(:each) do
      @game = GuessWordGame.new("mango", 3)
      @game.guess("m")
      @game.guess("y")
      @game.guess("n")
      @game.guess("p")
      @game.guess("o")
    end
    
    it "Test 12 : won returns false" do
      expect(@game.won?).to eql(false)
    end
    
    it "Test 13 : lost returns false" do
      expect(@game.lost?).to eql(false)
    end
    
    it "Test 14 : on returns true" do
      expect(@game.on?).to eql(true)
    end
    
    it "Test 15 : over returns false" do
      expect(@game.over?).to eql(false)
    end
    
    it "Test 16 : status returns Ongoing" do
      expect(@game.status).to eql("Ongoing")
    end
    
    it "Test 17 : returns masked word" do
      expect("Word: #{@game.masked_word}").to eql("Word: m _ n _ o")
    end

    it "Test 18 : returns remaining attempts" do
      expect("Remaining Attempts: #{@game.remaining_attempts}").to eql("Remaining Attempts: 1")
    end
  end

  context "game over" do
    context "game won" do
      before(:each) do
        @game = GuessWordGame.new("mango", 3)
        @game.guess("m")
        @game.guess("a")
        @game.guess("n")
        @game.guess("g")
        @game.guess("o")
      end
  
      it "Test 19 : won returns true" do
        expect(@game.won?).to eql(true)
      end
      
      it "Test 20 : lost returns false" do
        expect(@game.lost?).to eql(false)
      end
      
      it "Test 21 : on returns false" do
        expect(@game.on?).to eql(false)
      end
      
      it "Test 22 : over returns true" do
        expect(@game.over?).to eql(true)
      end
      
      it "Test 23 : status returns Won" do
        expect(@game.status).to eql("Won")
      end

      it "Test 24 : returns masked word" do
        expect("Word: #{@game.masked_word}").to eql("Word: m a n g o")
      end
  
      it "Test 25 : returns remaining attempts" do
        expect("Remaining Attempts: #{@game.remaining_attempts}").to eql("Remaining Attempts: 3")
      end
    end
  
    context "game lost" do
      before(:each) do
        @game = GuessWordGame.new("mango", 3)
        @game.guess("m")
        @game.guess("p")
        @game.guess("b")
        @game.guess("n")
        @game.guess("k")
      end
      
      it "Test 26 : won returns false" do
        expect(@game.won?).to eql(false)
      end
      
      it "Test 27 : lost returns true" do
        expect(@game.lost?).to eql(true)
      end
      
      it "Test 28 : on returns false" do
        expect(@game.on?).to eql(false)
      end
      
      it "Test 29 : over returns true" do
        expect(@game.over?).to eql(true)
      end
      
      it "Test 30 : status returns Lost" do
        expect(@game.status).to eql("Lost")
      end

      it "Test 31 : returns masked word" do
        expect("Word: #{@game.masked_word}").to eql("Word: m _ n _ _")
      end
  
      it "Test 32 : returns remaining attempts" do
        expect("Remaining Attempts: #{@game.remaining_attempts}").to eql("Remaining Attempts: 0")
      end
    end
  end
end