require "http/client"
require "json"

url = "https://wttr.in?format=j1"
response = HTTP::Client.get(url)
json = JSON.parse(response.body.to_s)

country = json["nearest_area"][0]["country"][0]["value"]
weather = json["current_condition"][0]["weatherDesc"][0]["value"]
temperature = json["current_condition"][0]["temp_C"]

puts "Country: #{country}"
puts "Weather: #{weather}";
puts "Temperature: #{temperature}°C";