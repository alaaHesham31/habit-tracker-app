import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;

  // Define a static gradient
  static const LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFFFFA726), // Light Orange
      Color(0xFFFF5722), // Dark Orange
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  const GradientText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white, // Set to white to make gradient visible
        ),
      ),
    );
  }
}
