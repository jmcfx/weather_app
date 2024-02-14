import 'dart:convert';
import 'package:weather_app/controllers/config.dart';
import 'package:http/http.dart' as http;

typedef TempUpdateCallback =  Function(Map<String,dynamic> temp);

//Get Current Weather API.......
Future<Map<String,dynamic>?> getCurrentWeather(TempUpdateCallback updateTemp) async {
  try {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey",
    );

    //HTTP GET Request......
    final response = await http.get(url);

    //CHECKING Status code...
    final data = jsonDecode(response.body);
    if (data['cod'] != '200') {
      throw 'An unexpected error Occurred';
    }

    ///
    updateTemp(data);
    return data;

  } catch (e) {
    throw e.toString();
  }
}
