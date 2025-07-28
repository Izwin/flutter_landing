import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/features/presentation/widgets/social_icon_widget.dart' show SocialIconWidget;
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.5),
        border: const Border(
          top: BorderSide(color: Color(0x1AFFFFFF)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© ${DateTime.now().year} DevVibe. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
} 