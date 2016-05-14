VALID_CHOICES = %w(rock paper scissors lizard spock)

def test_method
  prompt('test message')
end

def win?(first, second)
  (first == 'rock'     && ((second == 'scissors') || (second == 'lizard')))  ||
  (first == 'paper'    && ((second == 'rock')     || (second == 'spock')))   ||
  (first == 'scissors' && ((second == 'paper')    || (second == 'lizard')))  ||
  (first == 'lizard'   && ((second == 'paper')    || (second == 'spock')))   ||
  (first == 'spock'    && ((second == 'rock')     || (second == 'scissors')))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

# test_method

def prompt(message)
  puts "=> #{message}"
end

  player_score   = 0
  computer_score = 0

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, computer chose #{computer_choice}")

  display_results(choice, computer_choice)
  
  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  prompt("Player score:   #{player_score}")
  prompt("Computer score: #{computer_score}")

  prompt("Do you wish to play again?")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")