import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  const HourlyForecastItem({
    super.key,
    required this.time,
    required this.temperature, required this.icon,
  });
  final String time, temperature;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        width: 110,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
             Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              temperature,
            )
          ],
        ),
      ),
    );
  }
}
