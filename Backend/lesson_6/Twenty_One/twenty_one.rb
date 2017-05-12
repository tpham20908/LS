require 'pry'

SUITS = ['Heart', 'Diamond', 'Spade', 'Club']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

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
    sum += 11 if value == 'A'
    sum += 10 if value.to_i == 0
    sum += value.to_i
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def display_result(player_cards, dealer_cards)
  if total(player_cards) > 21
    prompt "You busted! Dealer won!"
  elsif total(dealer_cards) > 21
    prompt "Dealer busted! You won!"
  else
    case total(player_cards) <=> total(dealer_cards)
    when -1
      prompt "Dealer won!"
    when 1
      prompt "You won!"
    else
      prompt "It's a tie!"
    end
  end
end

def play_again?
  puts "---------------"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt "Welcome to Twenty-One!"
  puts "--------------------"
  desk = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << desk.pop
    dealer_cards << desk.pop
  end

  prompt "You have #{player_cards[0]} and #{player_cards[1]}," \
          "for a total of #{total(player_cards)}."
  prompt "Dealer has #{dealer_cards[0]} and [another]"

  loop do
    player_turn = ''

    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if %w(h s).include?(player_turn)
      prompt "Must choose 'h' or 's'!"
    end

    if player_turn == 'h'
      player_cards << desk.pop
      prompt "You now have #{player_cards} for a total of #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt "Your total is now #{total(player_cards)}."
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "You stay at #{total(player_cards)}."
  end

  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= 17
    prompt "Dealer hits!"
    dealer_cards << desk.pop
    prompt "Dealer cards are now #{dealer_cards}."
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now #{total(dealer_cards)}."
    display_result(player_cards, dealer_cards)
    play_again? ? next : break
  else
    prompt "Dealer stay at #{total(dealer_cards)}."
  end

  puts "=============="
    prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
    prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  puts "=============="

  display_result(player_cards, dealer_cards)

  break unless play_again?
end
