import 'package:clock_app/widget/gradient_border_container.dart';
import 'package:clock_app/widget/roman_numbers.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientBorderContainer(
          child: Center(
            child: RomanNumbers(),
          ),
        ),
      ),
    );
  }
}
