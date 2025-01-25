# GuessWordGame 🎮

A console-based word-guessing game built with Ruby. The game challenges players to guess a hidden word within a limited number of attempts while providing real-time feedback on their progress. Developed using the **Test-Driven Development (TDD)** methodology with RSpec for rigorous testing.

## Features 🚀

- **Interactive Gameplay**: Guess a word letter by letter with progress shown after every guess.
- **Dynamic Word Selection**: The game can randomly choose from a predefined list of words or allow a custom word.
- **Limited Attempts**: Players must guess the word within a set number of tries.
- **Real-Time Feedback**: Correctly guessed letters are revealed, while incorrect guesses reduce the remaining attempts.
- **Test-Driven Development**: Designed and implemented using RSpec for robust and reliable code.

## Gameplay Instructions 🕹️

1. Clone the repository to your local machine.
2. Run the game script to start the game.
3. Follow the prompts to guess letters for the hidden word.
4. Continue guessing until you either guess the word or run out of attempts.

## Getting Started 🛠️

### Installation

1. Clone the repository:
  ```bash
    git clone https://github.com/yourusername/GuessWordGame.git
  ```
2. Navigate to the project directory:
  ```bash
    cd GuessWordGame
  ```
3. Install dependencies:
  ```bash
    bundle install
  ```

### Running the Game

To play the game, run the following command:
  ```bash
    ruby game.rb
  ```

### Running Tests

To ensure all tests pass, execute:
  ```bash
    rspec
  ```

## Test-Driven Development 🧪

This project follows TDD principles with tests written in RSpec to validate game functionality. Key tests include:

- Validating word selection and hidden word display.
- Ensuring correct handling of guesses (correct and incorrect).
- Managing game over conditions (win or lose).
- Testing edge cases such as invalid input.

Thank you for checking out **GuessWordGame**! Have fun guessing! 🎉
