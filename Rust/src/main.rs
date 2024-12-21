use reqwest::blocking::get;
use serde_json::Value;

fn main() {
    let url = "https://wttr.in?format=j1";
    let response = get(url).unwrap().text().unwrap();
    let data: Value = serde_json::from_str(&response).unwrap();

    let country = &data["nearest_area"][0]["country"][0]["value"];
    let temperature = &data["current_condition"][0]["temp_C"];
    let weather = &data["current_condition"][0]["weatherDesc"][0]["value"];

    println!("Country: {}", country);
    println!("Weather: {}", weather);
    println!("Temperature: {}°C", temperature);
}
