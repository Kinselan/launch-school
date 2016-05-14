=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = []
  suits  = ['hearts', 'diamonds', 'clubs', 'spades']
  values = %w( 2 3 4 5 6 7 8 9 10 j q k a)

  suits.each do |suit|
    values.each do |value|
      deck << [value, suit]
    end
  end
  deck.shuffle!
  deck
end

def score(hand)
  score = 0
  aces = 0
  hand.each do |card|
    if (2..10).include?(card[0].to_i)
      score += card[0].to_i
    elsif card[0] == 'j' || card[0] == 'q' || card[0] == 'k'
      score += 10
    else
      aces += 1
    end
  end


  aces.times { score += 1 }
  aces.times do
    if score < 11
      score += 10
    end
  end
  score
end

def display_cards(player_cards, dealer_cards)
  system 'clear'
  prompt "Player has: #{score(player_cards)} with cards: " + player_cards.to_s
  prompt "Dealer has: #{score(dealer_cards)} with cards: " + dealer_cards.to_s
  prompt " "
  prompt "Player's Hand has a value of #{score(player_cards)}"
end

deck = initialize_deck

player_cards = []
dealer_cards = []
winner = ''

2.times do
  player_cards << deck.pop
  dealer_cards << deck.pop
end

loop do
  display_cards(player_cards, dealer_cards)

  if score(player_cards) > 21
    prompt "You've busted! Game over!"
    winner = 'Computer'
    break
  end

  prompt "Do you want to h) hit or s) stay?"
  answer = gets.chomp

  if answer == 'h'
    player_cards << deck.pop
  else
    break
  end
end

unless winner == 'Computer'
  loop do
    if score(dealer_cards) < 17
      dealer_cards << deck.pop
    elsif score(dealer_cards) > 20
      prompt "Dealer busted! You win!"
      break
    else
      if score(dealer_cards) > score(player_cards)
        prompt "Dealer wins!"
        break
      elsif score(player_cars) > score(dealer_cards)
        prompt "You win!"
        break
      else
        prompt "It's a tie!"
        break
      end
    end
  end
end