import Foundation

let urlString: String = "https://wttr.in?format=j1"

guard let url = URL(string: urlString) else {
    print("Invalid URL")
    exit(1)
}

let semaphore = DispatchSemaphore(value: 0)

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    defer { semaphore.signal() }

    if let error = error {
        print("Error: \(error)")
        return
    }

    guard let data = data else {
        print("No data received")
        return
    }

    do {
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
           let nearestArea = json["nearest_area"] as? [[String: Any]],
           let countryArr = nearestArea.first?["country"] as? [[String: Any]],
           let country = countryArr.first?["value"] as? String,
           let currentCondition = json["current_condition"] as? [[String: Any]],
           let weatherArr = currentCondition.first?["weatherDesc"] as? [[String: Any]],
           let weather = weatherArr.first?["value"] as? String,
           let temperature = currentCondition.first?["temp_C"] as? String {

            print("Country: \(country)")
            print("Weather: \(weather)")
            print("Temperature: \(temperature)°C")
        } else {
            print("Invalid JSON structure")
        }
    } catch {
        print("Failed to parse JSON: \(error)")
    }
}

task.resume()
semaphore.wait()