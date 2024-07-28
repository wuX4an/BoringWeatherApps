import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final url = 'https://wttr.in?format=j1';
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();

  final jsonString = await response.transform(Utf8Decoder()).join();
  final json = JsonDecoder().convert(jsonString);

  final country = json['nearest_area'][0]['country'][0]['value'];
  final weather = json['current_condition'][0]['weatherDesc'][0]['value'];
  final temperature = json['current_condition'][0]['temp_C'];

  print('Country: $country');
  print('Temperature: $temperature°C');
  print('Weather: $weather');
}
