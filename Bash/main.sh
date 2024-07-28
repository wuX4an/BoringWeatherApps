#!/usr/bin/bash

# Fetch weather data using `curl` (more widely available than `requests`)
weather_data=$(curl -sSL "https://wttr.in?format=j1")

# Parse JSON data using `jq-linux-amd64` (powerful JSON processing tool)

country=$(echo "$weather_data" | jq -r '.nearest_area[0].country[0].value')
weather=$(echo "$weather_data" | jq -r '.current_condition[0].weatherDesc[0].value')
temperature=$(echo "$weather_data" | jq -r '.current_condition[0].temp_C')

# Print the weather information in a clear and user-friendly format
printf "Country: %s\n" "$country"
printf "Temperature: %s°C\n" "$temperature"
printf "Weather: %s\n" "$weather"
