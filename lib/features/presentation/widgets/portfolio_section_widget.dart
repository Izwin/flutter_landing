import 'package:devvibe_landing/core/utils/context_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart' show AppColors;
import 'portfolio_item_widget.dart';

class PortfolioSectionWidget extends StatelessWidget {
  final GlobalKey portfolioKey;

  const PortfolioSectionWidget({super.key, required this.portfolioKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: portfolioKey,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 16 : 60,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            AppColors.accent3.withOpacity(0.7),
            AppColors.primary,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 8 : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Portfolio',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.accent2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Recent Projects',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          
          // Portfolio items with responsive layout
          context.isMobile
              ? _buildMobilePortfolioItems()
              : _buildDesktopPortfolioItems(),
        ],
      ),
    );
  }

  Widget _buildMobilePortfolioItems() {
    return Column(
      children: [
        PortfolioItemWidget(
          title: 'Charify',
          description: 'Charify is a charity fundraising application built with Flutter, designed to simplify donations for users. The app features Google authentication via Firebase, seamless payment processing using Stripe, and a clean, user-friendly interface.',
          technologies: ['Flutter', 'Stripe', 'Firebase', 'BLoC'],
          youtubeUrl: 'https://www.youtube.com/watch?v=QGMU75HvMg8',
          iconPath: 'assets/images/app_screenshots/charify.png',
        ),
        const SizedBox(height: 40),
        PortfolioItemWidget(
          title: 'Chronicle',
          description: 'Chronicle is a modern application developed using Flutter. This open-source project is created for educational purposes, demonstrating how to build applications with Flutter, including routing, network communication, authentication, and state management.',
          technologies: ['Flutter', 'Firebase', 'WebSockets', 'NodeJs'],
          iconPath: 'assets/images/app_screenshots/chronicle.png',
          youtubeUrl: 'https://www.youtube.com/watch?v=MRSZEVyRriM',
        ),
        const SizedBox(height: 40),
        PortfolioItemWidget(
          title: 'Plaka',
          description: 'A social network app that reached 30,000 users in Germany',
          technologies: ['Flutter', 'Firebase', 'Node.js', 'MongoDB'],
          appStoreUrl: 'https://apps.apple.com/de/app/plaka/id6740456506',
          googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.devvibe.plaka',
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          iconPath: 'assets/images/app_screenshots/plaka.png',
        ),
      ],
    );
  }

  Widget _buildDesktopPortfolioItems() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:   PortfolioItemWidget(
                title: 'Chronicle',
                description: 'Chronicle is a modern application developed using Flutter. This open-source project is created for educational purposes, demonstrating how to build applications with Flutter, including routing, network communication, authentication, and state management.',
                technologies: ['Flutter', 'Firebase', 'WebSockets', 'NodeJs'],
                iconPath: 'assets/images/app_screenshots/chronicle.png',
                youtubeUrl: 'https://www.youtube.com/watch?v=MRSZEVyRriM',
              ),
            ),

            const SizedBox(width: 30),
            Expanded(
              child:   PortfolioItemWidget(
                title: 'Charify',
                description: 'Charify is a charity fundraising application built with Flutter, designed to simplify donations for users. The app features Google authentication via Firebase, seamless payment processing using Stripe, and a clean, user-friendly interface.',
                technologies: ['Flutter', 'Stripe', 'Firebase', 'BLoC'],
                youtubeUrl: 'https://www.youtube.com/watch?v=QGMU75HvMg8',
                iconPath: 'assets/images/app_screenshots/charify.png',
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        PortfolioItemWidget(
          title: 'Plaka',
          description: 'A social network app that reached 30,000 users in Germany',
          technologies: ['Flutter', 'Firebase', 'Node.js', 'MongoDB'],
          appStoreUrl: 'https://apps.apple.com/de/app/plaka/id6740456506',
          googlePlayUrl: 'https://play.google.com/store/apps/details?id=com.devvibe.plaka',
          youtubeUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
          iconPath: 'assets/images/app_screenshots/plaka.png',
        ),
      ],
    );
  }
}
