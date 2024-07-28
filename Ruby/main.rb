require 'uri'
require 'net/http'
require 'json'

uri = URI('https://wttr.in?format=j1')
req = Net::HTTP.get_response(uri)
res =  req.body
json = JSON.parse res


country = json['nearest_area'][0]['country'][0]['value']
temperature = json['current_condition'][0]['temp_C']
weather = json['current_condition'][0]['weatherDesc'][0]['value']

puts("Country: %{country}" % {:country =>country})
puts("Weather: %{weather}" % {:weather =>weather})
puts("Temperature: %{temperature}°C" % {:temperature =>temperature})

