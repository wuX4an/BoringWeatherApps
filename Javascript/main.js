const url = "https://wttr.in?format=j1";
const response = await fetch(url);
const json = await response.json();

const country = json.nearest_area[0].country[0].value
const weather = json.current_condition[0].weatherDesc[0].value
const temperature = json.current_condition[0].temp_C

console.log("Country: " + country)
console.log("Weather: " + weather)
console.log("Temperature: " + temperature + "°C")
