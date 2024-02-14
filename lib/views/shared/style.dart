import 'package:flutter/material.dart';

  //custom Sized Box ....
SizedBox customSizedBox() {
    return const SizedBox(
      height: 16,
    );
  }


// Sub Header container...
class SubHeaderContainer extends StatelessWidget {
  const SubHeaderContainer({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
