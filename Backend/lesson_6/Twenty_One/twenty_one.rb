SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
MAX_POINT = 21
SATISFIED_POINT = MAX_POINT - 4

def clear_screen
  system('clear') || system('cls')
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == "A"
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  values.count { |value| value == 'A' }.times do
    sum -= 10 if sum > MAX_POINT
  end

  sum
end

def busted?(total_value)
  total_value > MAX_POINT
end

# rubocop: disable Metrics/MethodLength
def detect_result(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAX_POINT
    :player_busted
  elsif dealer_total > MAX_POINT
    :dealer_busted
  else
    case player_total <=> dealer_total
    when -1
      :dealer
    when 1
      :player
    else
      :tie
    end
  end
end

def display_result(player_cards, dealer_cards)
  result = detect_result(player_cards, dealer_cards)
  case result
  when :player_busted
    prompt "You busted! Dealer won!"
  when :dealer_busted
    prompt "Dealer busted! You won!"
  when :player
    prompt "You won!"
  when :dealer
    prompt "Dealer won!"
  else
    prompt "It's a tie!"
  end

  prompt "Press Enter to continue."
  gets
end
# rubocop: enable Metrics/MethodLength

def display_details(player_cards, dealer_cards, player_total, dealer_total)
  puts "=============="
  prompt "You have #{player_cards}, for a total of: #{player_total}"
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  puts "=============="
end

def display_round_result(player_score, dealer_score)
  prompt "You: #{player_score}, Dealer: #{dealer_score}"
end

def display_game_result(player_score, dealer_score)
  puts "************"
  case player_score <=> dealer_score
  when 1
    prompt "You won the game: #{player_score} to #{dealer_score}."
  when -1
    prompt "Dealer won the game #{dealer_score} to #{player_score}."
  end
  puts "************"
end

def play_again?
  puts ""
  puts ""
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  player_score = 0
  dealer_score = 0
  game_score = 0

  loop do
    game_score = [player_score, dealer_score].max
    break if game_score == 5

    clear_screen
    prompt "Welcome to Twenty-One!"
    puts "--------------------"
    display_round_result(player_score, dealer_score)
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    prompt "You have #{player_cards[0]} and #{player_cards[1]}," \
            " for a total of #{player_total}."
    prompt "Dealer has #{dealer_cards[0]} and [another]"

    loop do
      player_turn = ''

      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Must choose 'h' or 's'!"
      end

      if player_turn == 'h'
        player_cards << deck.pop
        player_total = total(player_cards)
        prompt "You now have #{player_cards} for a total of #{player_total}"
      end

      break if player_turn == 's' || busted?(player_total)
    end

    if busted?(player_total)
      display_details(player_cards, dealer_cards, player_total, dealer_total)
      display_result(player_cards, dealer_cards)
      dealer_score += 1
      next
    else
      prompt "You stay at #{player_total}."
    end

    prompt "Dealer turn..."

    loop do
      break if total(dealer_cards) >= SATISFIED_POINT
      prompt "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      prompt "Dealer cards are now #{dealer_cards}."
    end

    if busted?(dealer_total)
      display_details(player_cards, dealer_cards, player_total, dealer_total)
      display_result(player_cards, dealer_cards)
      player_score += 1
      next
    else
      prompt "Dealer stay at #{dealer_total}."
    end

    display_details(player_cards, dealer_cards, player_total, dealer_total)

    if detect_result(player_cards, dealer_cards) == :player
      player_score += 1
    elsif detect_result(player_cards, dealer_cards) == :dealer
      dealer_score += 1
    end

    display_result(player_cards, dealer_cards)
  end

  display_game_result(player_score, dealer_score)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One. Goodbye!"
