import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/features/presentation/widgets/contact_form_widget.dart';
import 'package:devvibe_landing/features/presentation/widgets/contact_item_widget.dart';
import 'package:flutter/material.dart';
class ContactSectionWidget extends StatelessWidget {
  final GlobalKey contactFormKey;

  const ContactSectionWidget({
    super.key,
    required this.contactFormKey,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      key: contactFormKey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.accent2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Start Your Project',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          isMobile
              ?  ContactFormWidget()
              : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s Build Something Amazing Together',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Whether you need a mobile app, web application, or a complete digital solution, I can help bring your vision to life.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const ContactItemWidget(
                      icon: Icons.email,
                      label: 'Email',
                      value: 'halilovrauf268@gmail.com',
                    ),
                    const SizedBox(height: 16),
                    const ContactItemWidget(
                      icon: Icons.language,
                      label: 'YouTube',
                      value: '3,000+ Subscribers',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 48),
               Expanded(
                child: ContactFormWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 