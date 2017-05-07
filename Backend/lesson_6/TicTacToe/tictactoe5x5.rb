require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER1_MARKER = 'O'
COMPUTER2_MARKER = 'V'
NUM_OF_PLAYER = 3

WINNING_LINES = [
  [1, 2, 3], [2, 3, 4], [3, 4, 5],          # row
  [6, 7, 8], [7, 8, 9], [8, 9, 10],
  [11, 12, 13], [12, 13, 14], [13, 14, 15],
  [16, 17, 18], [17, 18, 19], [18, 19, 20],
  [21, 22, 23], [22, 23, 24], [23, 24, 25],
  [1, 6, 11], [6, 11, 16], [11, 16, 21],    # colunm
  [2, 7, 12], [7, 12, 17], [12, 17, 22],
  [3, 8, 13], [8, 13, 18], [13, 18, 23],
  [4, 9, 14], [9, 14, 19], [14, 19, 24],
  [5, 10, 15], [10, 15, 20], [15, 20, 25],
  [11, 17, 23], [6, 12, 18], [12, 18, 24],  # diagonal
  [1, 7, 13], [7, 13, 19], [13, 19, 25],
  [2, 8, 14], [8, 14, 20], [3, 9, 15],
  [3, 7, 11], [4, 8, 12], [8, 12, 16],
  [5, 9, 13], [9, 13, 17], [13, 17, 21],
  [10, 14, 18], [14, 18, 22], [15, 19, 23]
]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/AbcSize, Metrics/LineLength
def display_board(brd)
  system "cls"
  puts ""
  puts "     |     |     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  |  #{brd[4]}  |  #{brd[5]}"
  puts "     |     |     |     |"
  puts "-----+-----+-----+-----+-----"
  puts "     |     |     |     |"
  puts "  #{brd[6]}  |  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  |  #{brd[10]}"
  puts "     |     |     |     |"
  puts "-----+-----+-----+-----+-----"
  puts "     |     |     |     |"
  puts "  #{brd[11]}  |  #{brd[12]}  |  #{brd[13]}  |  #{brd[14]}  |  #{brd[15]}"
  puts "     |     |     |     |"
  puts "-----+-----+-----+-----+-----"
  puts "     |     |     |     |"
  puts "  #{brd[16]}  |  #{brd[17]}  |  #{brd[18]}  |  #{brd[19]}  |  #{brd[20]}"
  puts "     |     |     |     |"
  puts "-----+-----+-----+-----+-----"
  puts "     |     |     |     |"
  puts "  #{brd[21]}  |  #{brd[22]}  |  #{brd[23]}  |  #{brd[24]}  |  #{brd[25]}"
  puts "     |     |     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize, Metrics/LineLength

def initialize_board
  hsh = Hash.new
  (1..25).each { |number| hsh[number] = ' ' }
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

def computer1_places_piece!(brd)
  square = (finishing_squares(brd, COMPUTER1_MARKER).sample ||
            finishing_squares(brd, COMPUTER2_MARKER).sample ||
            finishing_squares(brd, PLAYER_MARKER).sample ||
            empty_square(brd).sample)

  brd[square] = COMPUTER1_MARKER
end

def computer2_places_piece!(brd)
  square = (finishing_squares(brd, COMPUTER2_MARKER).sample ||
            finishing_squares(brd, PLAYER_MARKER).sample ||
            finishing_squares(brd, COMPUTER1_MARKER).sample ||
            empty_square(brd).sample)

  brd[square] = COMPUTER2_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER1_MARKER) == 3
      return "Computer1"
    elsif brd.values_at(*line).count(COMPUTER2_MARKER) == 3
      return "Computer2"
    end
  end
  nil
end

def board_full?(brd)
  empty_square(brd).empty?
end

def display_winner(player_score, computer1_score, computer2_score, game_score)
  if player_score == game_score
    prompt "Player win the game: #{player_score}" \
    " to #{computer1_score} Computer1 and #{computer2_score} Computer2"
  elsif computer1_score == game_score
    prompt "Computer1 win the game #{computer1_score}" \
    " to #{player_score} Player and #{computer2_score} Computer2"
  else
    prompt "Computer2 win the game #{computer2_score}" \
    " to #{player_score} Player and #{computer1_score} Computer1"
  end
end

def alternate_player(player)
  (player + 1) % NUM_OF_PLAYER
end

def place_piece!(brd, player)
  case player
  when 0 then player_places_piece!(brd)
  when 1 then computer1_places_piece!(brd)
  when 2 then computer2_places_piece!(brd)
  end
end

def choose_player
  player = ''
  loop do
    prompt "Who moves first? 0: Player, 1: Computer1 or 2: Computer2"
    player = gets.chomp.to_i
    break if (0..NUM_OF_PLAYER).to_a.include?(player)
    prompt "It's not a valid player!"
  end
  player
end

loop do
  player_score = 0
  computer1_score = 0
  computer2_score = 0
  game_score = 0
  current_player = choose_player

  loop do
    board = initialize_board
    display_board(board)

    loop do
      display_board(board)
      prompt "Player: #{player_score}," \
      " Computer1: #{computer1_score}, Computer2: #{computer2_score}"
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      player_score += 1 if detect_winner(board).downcase == 'player'
      computer1_score += 1 if detect_winner(board).downcase == 'computer1'
      computer2_score += 1 if detect_winner(board).downcase == 'computer2'
    else
      prompt "It's a tie!"
    end

    game_score = [player_score, computer1_score, computer2_score].max

    break if game_score == 5
  end

  display_winner(player_score, computer1_score, computer2_score, game_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe. Good bye!"
