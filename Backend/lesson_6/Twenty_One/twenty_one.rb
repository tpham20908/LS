require 'pry'

SUITS = ['Heart', 'Diamond', 'Spade', 'Club']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

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

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

# rubocop: disable Metrics/MethodLength
def detect_result(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
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
# rubocop: enable Metrics/MethodLength

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
end

def play_again?
  puts "---------------"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  clear_screen
  prompt "Welcome to Twenty-One!"
  puts "--------------------"
  desk = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << desk.pop
    dealer_cards << desk.pop
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
      player_cards << desk.pop
      player_total = total(player_cards)
      prompt "You now have #{player_cards} for a total of #{player_total}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt "Your total is now #{player_total}."
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "You stay at #{player_total}."
  end

  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= 17
    prompt "Dealer hits!"
    dealer_cards << desk.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer cards are now #{dealer_cards}."
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now #{dealer_total}."
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "Dealer stay at #{dealer_total}."
  end

  puts "=============="
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  puts "=============="

  display_result(player_cards, dealer_cards)

  break unless play_again?
end

prompt "Thanks for playing Twenty-One. Goodbye!"
