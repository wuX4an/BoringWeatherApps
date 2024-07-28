import requests

url: str = "https://wttr.in?format=j1"
response: str = requests.get(url)
json: str = response.json()

country: str = json['nearest_area'][0]['country'][0]['value']
temperature: str = json['current_condition'][0]['temp_C']
weather: str = json['current_condition'][0]['weatherDesc'][0]['value']

print(f"Country: {country}")
print(f"Weather: {weather}")
print(f"Temperature: {temperature}°C")