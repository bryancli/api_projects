require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.

url_safe_latitude = URI.encode(the_latitude)
url_safe_longitude = URI.encode(the_longitude)

url_of_data_we_want = "https://api.forecast.io/forecast/ab5a5fcf35b1bdf9e80eb988b018d46f/#{url_safe_latitude},#{url_safe_longitude}"
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

# ...

the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["hourly"]["summary"]
the_day_outlook = parsed_data["daily"]["summary"]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
