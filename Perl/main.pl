use warnings;
use JSON::XS;

$url = 'https://wttr.in?format=j1';
$request = `curl -s -H 'Accept: application/json' $url`;

$response = decode_json($request);

my $country = $response->{'nearest_area'}[0]{'country'}[0]{'value'};
my $temperature = $response->{'current_condition'}[0]{'temp_C'};
my $weather = $response->{'current_condition'}[0]{'weatherDesc'}[0]{'value'};

print "Country: $country\n";
print "Temperature: $temperature°C\n";
print "Weather: $weather\n";
