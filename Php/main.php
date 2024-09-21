<?php
$url = "https://wttr.in?format=j1";
$response = file_get_contents($url);
$json = json_decode($response, true);

$country = $json['nearest_area'][0]['country'][0]['value'];
$weather = $json['current_condition'][0]['weatherDesc'][0]['value'];
$temperature = $json['current_condition'][0]['temp_C'];

echo "Country: " . $country . "\n";
echo "Weather: " . $weather . "\n";
echo "Temperature: " . $temperature . "°C\n";
?>
