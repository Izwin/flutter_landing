import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart' show AppColors;


class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.code, color: AppColors.accent2, size: 28),
        const SizedBox(width: 8),
        Text(
          'DevVibe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..shader = LinearGradient(
                colors: AppColors.gradientAccent,
              ).createShader(const Rect.fromLTWH(0, 0, 100, 50)),
          ),
        ),
      ],
    );
  }
}
