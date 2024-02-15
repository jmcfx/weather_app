import 'package:flutter/material.dart';
import 'package:weather_app/views/shared/additional_info_item.dart';
import 'package:weather_app/views/shared/hourly_forecast_item.dart';
import 'package:weather_app/views/shared/main_card_container.dart';
import 'package:weather_app/views/shared/style.dart';

class MainScreenUi extends StatelessWidget {
  const MainScreenUi({
    super.key,
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecast,
    required this.hourlyTemperature,
  });
  final String currentTemp,
      currentSky,
      currentPressure,
      currentWindSpeed,
      currentHumidity,
      hourlyForecast,
      hourlyTemperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Main card Container....
            MainCardContainer(
              temperature: "$currentTemp K",
              icon: currentSky == 'Clouds' || currentSky == 'Rain'
                  ? Icons.cloud
                  : Icons.sunny,
              weatherCondition: currentSky,
            ),
            const SizedBox(
              height: 20,
            ),
            const SubHeaderContainer(
              text: "Weather Condition",
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const HourlyForecastItem(
                    time: "",
                    temperature: "",
                    icon: Icons.cloud,
                  );
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
              height: 10,
            ),
            //additional information item....
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItems(
                  icon: Icons.water_drop,
                  text: "Humidity",
                  value: currentHumidity,
                ),
                AdditionalInfoItems(
                  icon: Icons.air,
                  text: "Wind Speed",
                  value: currentWindSpeed,
                ),
                AdditionalInfoItems(
                  icon: Icons.beach_access,
                  text: "Pressure",
                  value: currentPressure,
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
