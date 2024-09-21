import urllib.request
import json

url = "https://wttr.in?format=j1"
response = urllib.request.urlopen(url)
data = json.loads(response.read())

country = data["nearest_area"][0]["country"][0]["value"]
temperature = data["current_condition"][0]["temp_C"]
weather = data["current_condition"][0]["weatherDesc"][0]["value"]

print(f"Country: {country}")
print(f"Weather: {weather}")
print(f"Temperature: {temperature}°C")
