import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/core/utils/context_utils.dart';
import 'package:devvibe_landing/features/presentation/widgets/testimonial_card.dart' show TestimonialCard;
import 'package:flutter/material.dart';

class ReviewsSectionWidget extends StatelessWidget {

  final GlobalKey reviewsKey;

  const ReviewsSectionWidget({super.key, required this.reviewsKey});

  @override
  Widget build(BuildContext context) {
    return  Container(
      key: reviewsKey,
      padding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Testimonials',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.accent2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'What Clients Say',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          context.isMobile
              ? const Column(
            children: [
              TestimonialCard(
                quote: 'The social network app developed exceeded our expectations. It quickly gained traction and now has over 30,000 active users.',
                authorName: 'Client from Germany',
                authorRole: 'Startup Founder',
              ),
              SizedBox(height: 24),
              TestimonialCard(
                quote: 'Professional, responsive, and delivered exactly what we needed. The app works flawlessly across all devices.',
                authorName: 'John Smith',
                authorRole: 'Product Manager',
              ),
            ],
          )
              : const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TestimonialCard(
                  quote: 'The social network app developed exceeded our expectations. It quickly gained traction and now has over 30,000 active users.',
                  authorName: 'Client from Germany',
                  authorRole: 'Startup Founder',
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: TestimonialCard(
                  quote: 'Professional, responsive, and delivered exactly what we needed. The app works flawlessly across all devices.',
                  authorName: 'John Smith',
                  authorRole: 'Product Manager',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
