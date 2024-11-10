import 'package:clock_app/widget/clock_hand.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class RomanNumbers extends StatefulWidget {
  @override
  State<RomanNumbers> createState() => _RomanNumbersState();
}

class _RomanNumbersState extends State<RomanNumbers> {
  late Timer _timer;

  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    setState(() {
      _currentTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final List<String> romanNumerals = [
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
    'I',
    'II'
  ];

  @override
  Widget build(BuildContext context) {
    final secondAngle = _currentTime.second * (pi / 30);
    final minuteAngle =
        _currentTime.minute * (pi / 30) + _currentTime.second * (pi / 1800);
    final hourAngle = (_currentTime.hour % 12) * (pi / 6) +
        (_currentTime.minute / 60) * (pi / 6);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 330,
            height: 330,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
          ),
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade500,
                width: 1,
              ),
            ),
          ),
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade500,
                width: 1,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade600,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                ClockHandWidget(type: 'hour', angle: hourAngle),
                ClockHandWidget(type: 'minute', angle: minuteAngle),
                ClockHandWidget(type: 'second', angle: secondAngle),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade600,
                      width: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < romanNumerals.length; i++)
            Transform.translate(
              offset: Offset(
                130 * cos(2 * pi * i / romanNumerals.length),
                130 * sin(2 * pi * i / romanNumerals.length),
              ),
              child: Transform.rotate(
                angle: pi / 2 + (pi / 6) * i,
                child: Text(
                  romanNumerals[i],
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
