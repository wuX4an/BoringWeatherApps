using HTTP
using JSON

url = "https://wttr.in?format=j1"
response = HTTP.get(url)
json = JSON.parse(String(response.body))

country = json["nearest_area"][1]["country"][1]["value"]
temperature = string(json["current_condition"][1]["temp_C"])
weather = json["current_condition"][1]["weatherDesc"][1]["value"]

println("Country: ", country)
println("Weather: ", weather)
println("Temperature: ", temperature, "°C")
