import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(
          color: AppColors.primary,
        )),
        Positioned(top: -100,right: -100,child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [
              AppColors.accent1.withAlpha(20),
              AppColors.accent1.withAlpha(0)
            ])
          ),
        )),
        Positioned(bottom: -50,left: -50,child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                AppColors.accent2.withAlpha(20),
                AppColors.accent2.withAlpha(0)
              ])
          ),
        )),
      ],
    );
  }
}
