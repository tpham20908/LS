require 'yaml'

MESSAGES = YAML.load_file('rpssl_messages.yml')

VALID_CHOICE = %w(rock lizard spock scissors paper)

choice_list = %w(r l sp sc p)

choice_list_prompt = <<-msg
  Please choose one:
  r: rock
  p: paper
  sc: scissors
  sp: spock
  l: lizard
msg

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(choice1, choice2)
  i1 = VALID_CHOICE.index(choice1)
  i2 = VALID_CHOICE.index(choice2)
  base = VALID_CHOICE.length

  (i1 + 1) % base == i2 || (i1 + 3) % base == i2
end

def display_result(player, computer)
  if win?(player, computer)
    prompt(MESSAGES["you_scored"])
  elsif win?(computer, player)
    prompt(MESSAGES["computer_scored"])
  else
    prompt("Tie!")
  end
end

player_score = 0
computer_score = 0
leading_score = 0

while leading_score < 5
  player_choice_abb = ''
  loop do
    prompt(choice_list_prompt)
    player_choice_abb = Kernel.gets().chomp()
    if choice_list.include?(player_choice_abb)
      break
    else
      prompt(MESSAGES["wrong_choice"])
    end
  end

  player_choice = case player_choice_abb
                  when "r"
                    "rock"
                  when "p"
                    "paper"
                  when "sc"
                    "scissors"
                  when "sp"
                    "spock"
                  when "l"
                    "lizard"
                  end

  computer_choice = VALID_CHOICE.sample()

  prompt("You chose #{player_choice}, computer chose #{computer_choice}")

  display_result(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, player_choice)
    computer_score += 1
  end

  puts("\n")
  prompt("#{player_score} for you, #{computer_score} for computer".rjust(60))
  puts("\n")

  leading_score = [player_score, computer_score].max

end

puts("\n")
if player_score > computer_score
  prompt("You won #{player_score} to #{computer_score}".upcase.center(60))
else
  prompt("Computer won #{computer_score} to #{player_score}".upcase.center(60))
end
puts("\n")

prompt(MESSAGES["bye"])
