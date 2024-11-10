import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;

  const GradientBorderContainer({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 370,
            height: 370,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.7),
                ],
                center: Alignment.center,
                radius: 0.6,
              ),
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 10),
                  blurRadius: 40,
                  spreadRadius: 7,
                ),
              ],
            ),
          ),
          Container(
            width: 335,
            height: 335,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(185),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
