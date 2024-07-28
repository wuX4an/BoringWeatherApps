using HTTP
using JSON

# Define the URL to fetch weather data
url = "https://wttr.in?format=j1"

# Fetch the JSON data using HTTP.get
response = HTTP.get(url)

# Parse the JSON response
json = JSON.parse(String(response.body))

# Extract desired information
country = json["nearest_area"][1]["country"][1]["value"]
temperature = string(json["current_condition"][1]["temp_C"])
weather = json["current_condition"][1]["weatherDesc"][1]["value"]

# Print the weather information
println("Country: ", country)
println("Weather: ", weather)
println("Temperature: ", temperature, "°C")
