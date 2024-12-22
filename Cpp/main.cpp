#include <cpr/cpr.h>
#include <iostream>
#include <jansson.h>
using namespace std;

string url = "https://wttr.in/?format=j1";

string request() {
  cpr::Response r = cpr::Get(cpr::Url{url});
  if (r.status_code == 200) {
    return r.text;
  } else {
    throw std::runtime_error("Can't get data from wttr.in");
  }
}

int main() {
  // Get Data
  string data = request();

  // Parse
  json_error_t error;
  json_t *json = json_loads(data.c_str(), 0, &error);

  // Nearest Area
  json_t *nearest_area = json_object_get(json, "nearest_area");
  json_t *nearest_area_zero = json_array_get(nearest_area, 0);
  json_t *country = json_object_get(nearest_area_zero, "country");
  json_t *country_zero = json_array_get(country, 0);
  string country_value =
      json_string_value(json_object_get(country_zero, "value"));

  // Temperature
  json_t *current_condition = json_object_get(json, "current_condition");
  json_t *current_condition_zero = json_array_get(current_condition, 0);
  string temperature_value =
      json_string_value(json_object_get(current_condition_zero, "temp_C"));

  // Weather
  json_t *weatherDesc = json_object_get(current_condition_zero, "weatherDesc");
  json_t *weatherDesc_zero = json_array_get(weatherDesc, 0);
  string weatherDesc_value =
      json_string_value(json_object_get(weatherDesc_zero, "value"));

  cout << "Country: " << country_value << endl;
  cout << "Temperature: " << temperature_value << "°C" << endl;
  cout << "Weather: " << weatherDesc_value << endl;

  json_decref(json);
  return 0;
}
