require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.

# use address to get coordinates
url_of_coords_we_want = "http://maps.googleapis.com/maps/api/geocode/json?address=#{url_safe_address}"
raw_coords_data = open(url_of_coords_we_want).read
parsed_coords_data = JSON.parse(raw_coords_data)
the_latitude = parsed_coords_data["results"][0]["geometry"]["location"]["lat"] #already URL safe
the_longitude = parsed_coords_data["results"][0]["geometry"]["location"]["lng"] #already URL safe

# use coordinates to get weather forecast
url_of_weather_we_want = "https://api.forecast.io/forecast/ab5a5fcf35b1bdf9e80eb988b018d46f/#{the_latitude},#{the_longitude}"
raw_weather_data = open(url_of_weather_we_want).read
parsed_weather_data = JSON.parse(raw_weather_data)
the_temperature = parsed_weather_data["currently"]["temperature"]
the_hour_outlook = parsed_weather_data["hourly"]["summary"]
the_day_outlook = parsed_weather_data["daily"]["summary"]


# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
