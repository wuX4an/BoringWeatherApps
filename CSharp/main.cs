using System;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        string url = "https://wttr.in?format=j1";

        using (HttpClient client = new HttpClient())
        {
            try
            {
                string response = await client.GetStringAsync(url);
                var json = JsonDocument.Parse(response).RootElement;

                string country = json.GetProperty("nearest_area")[0]
                                   .GetProperty("country")[0]
                                   .GetProperty("value")
                                   .GetString() ?? "Unknown";

                string weather = json.GetProperty("current_condition")[0]
                                     .GetProperty("weatherDesc")[0]
                                     .GetProperty("value")
                                     .GetString() ?? "Unknown";

                string temperature = json.GetProperty("current_condition")[0]
                                         .GetProperty("temp_C")
                                         .GetString() ?? "Unknown";

                Console.WriteLine($"Country: {country}");
                Console.WriteLine($"Weather: {weather}");
                Console.WriteLine($"Temperature: {temperature}°C");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }
        }
    }
}
