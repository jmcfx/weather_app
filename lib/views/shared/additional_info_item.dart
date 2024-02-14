import 'package:flutter/material.dart';

class AdditionalInfoItems extends StatelessWidget {
  const AdditionalInfoItems({
    super.key,
    required this.icon,
    required this.text, required this.value,
  });
  final IconData icon;
  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(
          height: 8,
        ),
        Text(text),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
