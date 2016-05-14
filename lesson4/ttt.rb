require 'pry'

GOES_FIRST      = 'CHOOSE' # PLAYER, COMPUTER, or CHOOSE
INITIAL_MARKER  = ' '.freeze
PLAYER_MARKER   = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]].freeze       # diags

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You'e a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop enable Metrics/MethodLength, AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_threat?(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(INITIAL_MARKER) > 0 &&
       brd.values_at(*line).count(marker) == 2
      return true
    end
  end
  return false
end

def alternate_player(current_player)
  if current_player == 'Player'
    return 'Computer'
  else
    return 'Player'
  end
end

def smart_move(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(INITIAL_MARKER) > 0 &&
       brd.values_at(*line).count(marker) == 2

      line.each do |square|
        if brd[square] == INITIAL_MARKER
          return square
        end
      end
    end
  end
end

def computer_places_piece!(brd)
  if immediate_threat?(brd, COMPUTER_MARKER)
    square = smart_move(brd, COMPUTER_MARKER)
  elsif immediate_threat?(brd, PLAYER_MARKER)
    square = smart_move(brd, PLAYER_MARKER)
  elsif brd[5] == INITIAL_MARKER
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, current_player)
  if current_player == 'Player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  # *line passes in every element of array, one at a time
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def display_score(player_score, computer_score)
  prompt("You have #{player_score}, computer has #{computer_score}")
  prompt("First player to 5, wins!")
  prompt(" ")
end

player_score   = 0
computer_score = 0
current_player = 'Player'

loop do
  board = initialize_board

  case GOES_FIRST
  when 'Player'
    current_player = 'Player'
  when 'COMPUTER'
    current_player = 'Computer'
  when 'CHOOSE'
    prompt("Who goes first? 1) PLAYER 2) COMPUTER")
    answer = gets.chomp.to_i
    current_player = 'Computer' unless answer != 2
  end

  loop do
    display_board(board)
    display_score(player_score, computer_score)

    place_piece!(board, current_player)
    break if someone_won?(board) || board_full?(board)
    current_player = alternate_player(current_player)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    case detect_winner(board)
    when 'Player'
      player_score += 1
    when 'Computer'
      computer_score += 1
    end
  else
    prompt "It's a tie!"
  end

  break if player_score == 5 || computer_score == 5

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"