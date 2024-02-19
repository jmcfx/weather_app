import 'package:flutter/material.dart';
import 'package:weather_app/controllers/api/api_controller.dart';
import 'package:weather_app/views/shared/main_screen_padding.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<Map<String, dynamic>?> _weatherFuture;
  Map<String, dynamic>? temp;
  @override
  void initState() {
    super.initState();
    _weatherFuture = fetchWeatherAndUpdateUI();
  }

  Future<Map<String, dynamic>?> fetchWeatherAndUpdateUI() async {
    try {
      await getCurrentWeather((updateTemp) {
        setState(() {
          temp = updateTemp;
        });
      });
      return temp;
    } catch (e) {
      throw 'An unexpected error occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _weatherFuture = fetchWeatherAndUpdateUI();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final data = snapshot.data!;

          final currentWeatherData = data['list'][0];
          //Current Temperature from API...
          final currentTemp = currentWeatherData['main']['temp'].toString();
          //Current Sky From API...
          final currentSky = currentWeatherData['weather'][0]['main'];

          //Additional Information ....
          final currentPressure =
              currentWeatherData['main']['pressure'].toString();
          final currentWindSpeed =
              currentWeatherData['wind']['speed'].toString();
          final currentHumidity =
              currentWeatherData['main']['humidity'].toString();

          // Returns Main Screen UI if there isn't a snapshot Error....
          return MainScreenUi(
            weatherFuture: data,
            currentTemp: currentTemp,
            currentSky: currentSky,
            currentPressure: currentPressure,
            currentWindSpeed: currentWindSpeed,
            currentHumidity: currentHumidity,
          );
        },
      ),
    );
  }
}
