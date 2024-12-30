# Weather App in Multiple Programming Languages

## Introduction ⛅
### This comparison is because I was bored. 🙃
### The weather API I used is from: <https://wttr.in?format=j1>

### Algorithm:

``` 
START
  SET url = "https://wttr.in?format=j1"
  SET response = GetData(url)
  SET data = Json(response)
  SET country = data["nearest_area"][0]["country"][0]["value"]
  SET weather = data["current_condition"][0]["weatherDesc"][0]["value"]
  SET temperature = data["current_condition"][0]["temp_C"]
  
  PRINT "Country: " + country
  PRINT "Weather: " + weather
  PRINT "Temperature: " temperature + "°C"
END
```


## Programing Languajes:

- ### **Python**
- ### **JavaScript**
- ### **Perl**
- ### **Ruby**
- ### **Dart**
- ### **Julia**
- ### **Bash**
- ### **Crystal**
- ### **Php**
- ### **Go**
- ### **Rust**
- ### **C++**
- ### **C#**
- ### **Java**
