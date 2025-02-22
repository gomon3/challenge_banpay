import 'package:flutter/material.dart';
import 'package:challenge_banpay/core/constants/ui_color.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.text});

  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: kDefaultPaddin / 4,
              right: kDefaultPaddin / 2,
            ),
            padding: const EdgeInsets.all(2.5),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: kDefaultPaddin / 2), // Espaciado entre el punto y el texto
          Text(
            text,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}