import 'package:flutter/material.dart';
import 'package:weather_app/controllers/api_controller.dart';
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
            onPressed: () {},
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
          final temp = snapshot.data!;
          
          //Current Temperature from API...
          final currentTemp = temp['list'][0]['main']['temp'].toString();

          // Returns Main Screen UI if there isn't a snapshot Error....
          return MainScreenUi(currentTemp: currentTemp);
        },
      ),
    );
  }
}