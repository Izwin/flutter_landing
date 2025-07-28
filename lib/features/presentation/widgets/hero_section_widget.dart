import 'package:devvibe_landing/core/utils/context_utils.dart';
import 'package:devvibe_landing/features/presentation/widgets/animated_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSectionWidget extends StatelessWidget {
  final Function()? scrollToContacts;

  const HeroSectionWidget({super.key, this.scrollToContacts});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextSection(context),
          const SizedBox(height: 32),
          Image.asset('assets/images/hero_image.png'),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: _buildTextSection(context),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 3,
            child: Image.asset('assets/images/hero_image.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    final bool isMobile = context.isMobile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Apps That Launch, Scale & Actually Work.',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: isMobile ? double.infinity : 500,
          child: Text(
            'I help founders turn ideas into fast, beautiful Flutter apps. From 0 to 30K users — without wasting months.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white70,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: 500,
          child: Row(
            children: [
              AnimatedGradientButton(
                text: 'Get Started',
                onPressed: scrollToContacts,
                width: 160,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () async {
                      final url = Uri.parse('https://youtube.com/@devv1be');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_circle_outline),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'YouTube Channel',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
