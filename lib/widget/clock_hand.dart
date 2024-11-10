import 'package:flutter/material.dart';

class ClockHandWidget extends StatelessWidget {
  final String type;
  final double angle;

  ClockHandWidget({required this.type, required this.angle});

  @override
  Widget build(BuildContext context) {
    final Map<String, HandProperties> properties = {
      'hour': HandProperties(
        backLength: 20,
        frontLength: 100,
        width: 8,
        color: Colors.black,
      ),
      'minute': HandProperties(
        backLength: 20,
        frontLength: 100,
        width: 5,
        color: Colors.blue,
      ),
      'second': HandProperties(
        backLength: 15,
        frontLength: 115,
        width: 2,
        color: Colors.red,
      ),
    };

    final HandProperties props = properties[type]!;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateZ(angle),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: props.backLength,
            child: Container(
              height: props.backLength + props.frontLength,
              width: props.width,
              decoration: BoxDecoration(
                color: props.color,
                borderRadius: BorderRadius.circular(props.width / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HandProperties {
  final double backLength;
  final double frontLength;
  final double width;
  final Color color;

  HandProperties({
    required this.backLength,
    required this.frontLength,
    required this.width,
    required this.color,
  });
}
