import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/views/shared/style.dart';

class MainCardContainer extends StatelessWidget {
  const MainCardContainer({
    super.key,
    required this.temperature,
    required this.icon, required this.weatherCondition,
  });
  final String temperature, weatherCondition;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      temperature,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    customSizedBox(),
                    Icon(
                      icon,
                      size: 64,
                    ),
                    customSizedBox(),
                     Text(
                      weatherCondition,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
