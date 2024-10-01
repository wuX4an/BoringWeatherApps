package main

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type WeatherResponse struct {
	NearestArea     []Area       `json:"nearest_area"`
	CurrentCondition []Condition  `json:"current_condition"`
}

type Area struct {
	Country []Country `json:"country"`
}

type Country struct {
	Value string `json:"value"`
}

type Condition struct {
	WeatherDesc []Description `json:"weatherDesc"`
	TempC      string        `json:"temp_C"`
}

type Description struct {
	Value string `json:"value"`
}

func main() {
	url := "https://wttr.in?format=j1"
	response, err := http.Get(url)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer response.Body.Close()

	var jsonResponse WeatherResponse
	if err := json.NewDecoder(response.Body).Decode(&jsonResponse); err != nil {
		fmt.Println("Error decoding JSON:", err)
		return
	}

	country := jsonResponse.NearestArea[0].Country[0].Value
	weather := jsonResponse.CurrentCondition[0].WeatherDesc[0].Value
	temperature := jsonResponse.CurrentCondition[0].TempC

	fmt.Println("Country:", country)
	fmt.Println("Weather:", weather)
	fmt.Println("Temperature:", temperature+"°C")
}
