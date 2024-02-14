import 'package:flutter/material.dart';
import 'package:weather_app/views/shared/additional_info_item.dart';
import 'package:weather_app/views/shared/hourly_forecast_item.dart';
import 'package:weather_app/views/shared/main_card_container.dart';
import 'package:weather_app/views/shared/style.dart';

class MainScreenUi extends StatelessWidget {
  const MainScreenUi({
    super.key,
   required this.currentTemp,
  });
  final String currentTemp;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Main card Container....
            MainCardContainer(
              temperature: currentTemp,
              icon: Icons.cloud,
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
            //Weather forecast card...
            const SingleChildScrollView(
              //Hourly Forecast Item....
              child: Row(
                children: [
                  HourlyForecastItem(
                    time: "03:00",
                    temperature: "03.00",
                  ),
                ],
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfoItems(
                  icon: Icons.water_drop,
                  text: "Humidity",
                  value: "91",
                ),
                AdditionalInfoItems(
                  icon: Icons.air,
                  text: "Wind Speed",
                  value: "7.5",
                ),
                AdditionalInfoItems(
                  icon: Icons.beach_access,
                  text: "Pressure",
                  value: "1000",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
