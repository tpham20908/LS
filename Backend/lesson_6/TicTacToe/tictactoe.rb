require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],   # row
  [1, 4, 7], [2, 5, 8], [3, 6, 9],   # colunm
  [1, 5, 9], [3, 5, 7]               # diagonal
]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system "cls"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

def initialize_board
  hsh = Hash.new
  (1..9).each { |number| hsh[number] = ' ' }
  hsh
end

def empty_square(brd)
  brd.keys.select { |number| brd[number] == ' ' }
end

def joinor(arr, str1 = ', ', str2 = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{str2} ")
  else
    arr[-1] = "#{str2} #{arr.last}"
    arr.join(str1)
  end
end

def finishing_squares(brd, marker)
  placed_squares = brd.keys.select { |num| brd[num] == marker }
  offence_arr = WINNING_LINES.select { |arr| (arr - placed_squares).size == 1 }
  finishing_squares = offence_arr.map { |arr| arr - placed_squares }.flatten
  finishing_squares.select { |square| brd[square] == INITIAL_MARKER }
end

def advantage_5(brd)
  5 if empty_square(brd).include?(5)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a position to place a piece #{joinor(empty_square(brd))} "
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Please choose valid position!"
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = (finishing_squares(brd, COMPUTER_MARKER).sample ||
            finishing_squares(brd, PLAYER_MARKER).sample ||
            advantage_5(brd)||
            empty_square(brd).sample)

  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def board_full?(brd)
  empty_square(brd).empty?
end

def display_winner(player_score, computer_score, game_score)
  if player_score == game_score
    prompt "Player win the game: #{player_score} to #{computer_score}"
  else
    prompt "Computer win the game #{computer_score} to #{player_score}"
  end
end

loop do
  player_score = 0
  computer_score = 0
  game_score = 0

  loop do
    board = initialize_board

    loop do
      display_board(board)

      prompt "Player: #{player_score}, Computer: #{computer_score}"

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      player_score += 1 if detect_winner(board).downcase == 'player'
      computer_score += 1 if detect_winner(board).downcase == 'computer'
    else
      prompt "It's a tie!"
    end

    game_score = [player_score, computer_score].max

    break if game_score == 5
  end

  display_winner(player_score, computer_score, game_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe. Good bye!"
