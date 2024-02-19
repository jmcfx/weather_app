// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/views/shared/additional_info_item.dart';
import 'package:weather_app/views/shared/hourly_forecast_item.dart';
import 'package:weather_app/views/shared/main_card_container.dart';
import 'package:weather_app/views/shared/style.dart';



class MainScreenUi extends StatefulWidget {
  const MainScreenUi({
    Key? key,
    required this.weatherFuture,
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
  }) : super(key: key);

  final Map<String, dynamic> weatherFuture;
  final String currentTemp,
      currentSky,
      currentPressure,
      currentWindSpeed,
      currentHumidity;

  @override
  State<MainScreenUi> createState() => _MainScreenUiState();
}

class _MainScreenUiState extends State<MainScreenUi> {
  late Map<String, dynamic> weatherData;
  late String _currentTemp,
      _currentSky,
      _currentPressure,
      _currentWindSpeed,
      _currentHumidity;
  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherFuture;
    _currentTemp = widget.currentTemp;
    _currentSky = widget.currentSky;
    _currentPressure = widget.currentPressure;
    _currentWindSpeed = widget.currentWindSpeed;
    _currentHumidity = widget.currentHumidity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Main card Container....
            MainCardContainer(
              temperature: "$_currentTemp k",
              icon: _currentSky == 'Clouds' || _currentSky == 'Rain'
                  ? Icons.cloud
                  : Icons.sunny,
              weatherCondition: _currentSky,
            ),
            const SizedBox(
              height: 20,
            ),
            const SubHeaderContainer(
              text: "Hourly Weather Forecast",
            ),
            const SizedBox(
              height: 16,
            ),
            //Hourly Forecast List Items ....
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final hourlyForecast = weatherData['list'][index + 1];
                  final hourlySky =
                      weatherData['list'][index + 1]['weather'][0]['main'];
                  final hourlyTemp = hourlyForecast['main']['temp'].toString();
                  final time = DateTime.parse(hourlyForecast['dt_txt']);
                  return HourlyForecastItem(
                      time:DateFormat.j().format(time),
                      temperature: hourlyTemp,
                      icon: hourlySky == 'Clouds' || hourlySky == "Rain"
                          ? Icons.cloud
                          : Icons.sunny);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //additional information..
            const SubHeaderContainer(
              text: "Additional Information ",
            ),
            const SizedBox(
              height: 15,
            ),
            //additional information item....
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItems(
                  icon: Icons.water_drop,
                  text: "Humidity",
                  value: _currentHumidity,
                ),
                AdditionalInfoItems(
                  icon: Icons.air,
                  text: "Wind Speed",
                  value: _currentWindSpeed,
                ),
                AdditionalInfoItems(
                  icon: Icons.beach_access,
                  text: "Pressure",
                  value: _currentPressure,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
