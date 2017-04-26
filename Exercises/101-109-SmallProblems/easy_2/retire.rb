puts 'What is your age? '
age = gets().chomp().to_i

puts 'What age would you like to retire? '
retired_age = gets().chomp().to_i

current_year = Time.now.year
working_year_remaining = retired_age - age
retired_year = current_year + working_year_remaining

puts "It's #{current_year}. You will retire in #{retired_year}. \n" + \
    "You have only #{working_year_remaining} years of work to go!"
