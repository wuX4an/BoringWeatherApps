

import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import org.json.JSONObject;

public class WeatherApps {
    @SuppressWarnings("deprecation")
    public static void main(String[] args) {
        
        try {
    //GET URL WeatherApp.java

            String apiUrl = "https://wttr.in?format=j1";
            URL url = new URL(apiUrl);
    //MAKE CONNECTION TO API
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();      
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");
    //CHECK If CONNecTION IS MADE SUCESSFULLY
            if (conn.getResponseCode() != 200) {
                throw new RuntimeException("HTTP error code: " + conn.getResponseCode());
            } else {
    //READ $ STORE THE DATA
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String temp;
                while ((temp = br.readLine()) != null) {
                    response.append(temp);
                }
                br.close();
    //GETTING DESIRED DATA           
                JSONObject data = new JSONObject(response.toString());
                JSONObject nearest_area = data.getJSONArray("nearest_area").getJSONObject(0);
                String country = nearest_area.getJSONArray("country").getJSONObject(0).getString("value");
                JSONObject current_condition = data.getJSONArray("current_condition").getJSONObject(0);
                String tempr = current_condition.getString("temp_C");
                String weather = current_condition.getJSONArray("weatherDesc").getJSONObject(0).getString("value");
    //PRINTING DESIRED DATA
                System.out.println("Country: "+country);
                System.out.println("Weather: "+weather);
                System.out.println("Temperature : " +tempr + "°C");
            }   


        } catch (Exception e) {
            System.err.println("Error"+e.getMessage());;
        }
    }

}