use reqwest::blocking::get;
use reqwest::Error;
use serde::Deserialize;

#[derive(Deserialize)]
struct WeatherResponse {
    nearest_area: Vec<Area>,
    current_condition: Vec<Condition>,
}

#[derive(Deserialize)]
struct Area {
    country: Vec<Country>,
}

#[derive(Deserialize)]
struct Country {
    value: String,
}

#[derive(Deserialize)]
struct Condition {
    weatherDesc: Vec<WeatherDesc>,
    temp_C: String,
}

#[derive(Deserialize)]
struct WeatherDesc {
    value: String,
}

fn main() -> Result<(), Error> {
    let url = "https://wttr.in?format=j1";
    let response: WeatherResponse = get(url)?.json()?;

    let country = &response.nearest_area[0].country[0].value;
    let weather = &response.current_condition[0].weatherDesc[0].value;
    let temperature = &response.current_condition[0].temp_C;

    println!("Country: {}", country);
    println!("Weather: {}", weather);
    println!("Temperature: {}°C", temperature);

    Ok(())
}


