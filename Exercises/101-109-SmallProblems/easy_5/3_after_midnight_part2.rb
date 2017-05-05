MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_of_day)
  hours, minutes = time_of_day.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_of_day)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_of_day)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# after_midnight('00:00')
# before_midnight('00:00')
# after_midnight('12:34')
# before_midnight('12:34')
# after_midnight('24:00')
# before_midnight('24:00')