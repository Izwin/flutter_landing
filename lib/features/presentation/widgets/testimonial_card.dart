import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class TestimonialCard extends StatelessWidget {
  final String quote;
  final String authorName;
  final String authorRole;
  final String? authorImage;
  
  const TestimonialCard({
    super.key,
    required this.quote,
    required this.authorName,
    required this.authorRole,
    this.authorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.format_quote,
          color: AppColors.accent1,
          size: 36,
        ),
        const SizedBox(height: 16),
        Text(
          quote,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            if (authorImage != null) ...[
              CircleAvatar(
                backgroundImage: NetworkImage(authorImage!),
                radius: 20,
              ),
              const SizedBox(width: 12),
            ] else ...[
              CircleAvatar(
                backgroundColor: AppColors.accent1.withOpacity(0.2),
                radius: 20,
                child: Text(
                  authorName.isNotEmpty ? authorName[0].toUpperCase() : '',
                  style: const TextStyle(
                    color: AppColors.accent1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  authorRole,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
} 