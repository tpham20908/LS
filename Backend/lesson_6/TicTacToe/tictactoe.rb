require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
NUM_OF_PLAYER = 2

WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],   # row
  [1, 4, 7], [2, 5, 8], [3, 6, 9],   # colunm
  [1, 5, 9], [3, 5, 7]               # diagonal
]

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  clear_screen
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

def count_marker_in(brd, line, marker)
  brd.values_at(*line).count(marker)
end

def empty_square_in(brd, line)
  line.select { |marker| brd[marker] == INITIAL_MARKER }.first
end

def threat_squares(brd, marker)
  WINNING_LINES.each do |line|
    if count_marker_in(brd, line, INITIAL_MARKER) == 1 &&
       count_marker_in(brd, line, marker) == 2
      return empty_square_in(brd, line)
    end
  end
  nil
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
  square = (threat_squares(brd, COMPUTER_MARKER) ||
            threat_squares(brd, PLAYER_MARKER) ||
            advantage_5(brd) ||
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
    prompt "Player won the game: #{player_score} to #{computer_score}"
  else
    prompt "Computer won the game #{computer_score} to #{player_score}"
  end
end

def alternate_player(player)
  (player + 1) % NUM_OF_PLAYER
end

def place_piece!(brd, player)
  case player
  when 0 then player_places_piece!(brd)
  when 1 then computer_places_piece!(brd)
  end
end

def choose_player_going_first
  player = ''
  loop do
    prompt "Who moves first? p: Player or c: Computer"
    player = gets.chomp.downcase
    break if ['p', 'c'].include?(player)
    prompt "It's not a valid player!"
  end
  player == 'p' ? 0 : 1
end

def play_again
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    break if answer.downcase.start_with?('y', 'n')
    prompt "Don't understand!"
  end
  answer == 'y'
end

def display_round_winner(player)
  loop do
    if player
      prompt "#{player} won!"
    else
      prompt "It's a tie!"
    end
    prompt "Press \[any key\] Enter to continue."
    key_pressed = gets
    break if /.*/.match(key_pressed)
  end
end

loop do
  player_score = 0
  computer_score = 0
  game_score = 0
  current_player = choose_player_going_first

  loop do
    board = initialize_board

    loop do
      display_board(board)
      prompt "Player: #{player_score}, Computer: #{computer_score}"
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      round_winner = detect_winner(board)
      display_round_winner(round_winner)
      player_score += 1 if round_winner.downcase == 'player'
      computer_score += 1 if round_winner.downcase == 'computer'
    else
      display_round_winner(nil)
    end

    game_score = [player_score, computer_score].max

    break if game_score == 5
  end

  display_winner(player_score, computer_score, game_score)
  break unless play_again
end

prompt "Thanks for playing Tic-Tac-Toe. Good bye!"
