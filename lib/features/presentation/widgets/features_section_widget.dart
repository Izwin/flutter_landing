import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/core/utils/context_utils.dart';
import 'package:devvibe_landing/features/presentation/widgets/feature_card.dart';
import 'package:flutter/material.dart';

class FeaturesSectionWidget extends StatelessWidget {
  final GlobalKey servicesKey;

  const FeaturesSectionWidget({super.key, required this.servicesKey});
  static const features = [
    {
      'icon': Icons.design_services,
      'title': 'Premium UI/UX Design',
      'description': 'Crafting stunning, user-friendly interfaces that boost engagement and make your brand unforgettable.',
    },
    {
      'icon': Icons.developer_mode,
      'title': 'High-Performance Flutter Apps',
      'description': 'Building fast, reliable, cross-platform mobile apps with native-like performance on both iOS and Android.',
    },
    {
      'icon': Icons.storage,
      'title': 'Robust Backend Solutions',
      'description': 'Delivering scalable and secure backend architectures built to support growth and seamless functionality.',
    },
    {
      'icon': Icons.support_agent,
      'title': 'Ongoing Support & Growth',
      'description': 'From updates to maintenance—we ensure your app runs smoothly and evolves with your business needs.',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      key: servicesKey,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.accent2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Full-Cycle App Development',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          context.isMobile
              ? Column(
            children: features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: FeatureCard(
                  icon: feature['icon'] as IconData,
                  title: feature['title'] as String,
                  description: feature['description'] as String,
                ),
              );
            }).toList(),
          )
              : GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.5,
            children: features.map((feature) {
              return FeatureCard(
                icon: feature['icon'] as IconData,
                title: feature['title'] as String,
                description: feature['description'] as String,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
