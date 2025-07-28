import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

import 'tech_chip_widget.dart';

class PortfolioItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String? appStoreUrl;
  final String? googlePlayUrl;
  final String? youtubeUrl;
  final String iconPath;

  PortfolioItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    this.appStoreUrl,
    this.googlePlayUrl,
    this.youtubeUrl,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasStoreLinks = (appStoreUrl != null && appStoreUrl!.isNotEmpty) ||
                              (googlePlayUrl != null && googlePlayUrl!.isNotEmpty);
    
    final bool hasYoutubeLink = youtubeUrl != null && youtubeUrl!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent3.withOpacity(0.9),
            AppColors.accent3.withOpacity(0.5),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.accent2.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _buildIcon(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Divider(color: Colors.white10),
          const SizedBox(height: 16),

          // Technologies
          Text(
            'Technologies',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.accent2,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies
                .map((tech) => TechChipWidget(text: tech))
                .toList(),
          ),
          const SizedBox(height: 16),


          Row(
            children: [
              // YouTube button
              if (hasYoutubeLink)
                Expanded(
                  child: _buildYoutubeButton(context),
                ),
                
              // Spacer if both YouTube and store links exist
              if (hasYoutubeLink && hasStoreLinks)
                const SizedBox(width: 16),
                
              // Store links
              if (hasStoreLinks)
                Expanded(
                  child: Row(
                    children: [
                      if (appStoreUrl != null && appStoreUrl!.isNotEmpty)
                        Expanded(
                          child: _buildStoreButton(
                            context,
                            'App Store',
                            Icons.apple,
                            appStoreUrl!,
                          ),
                        ),
                      if (appStoreUrl != null && appStoreUrl!.isNotEmpty && 
                          googlePlayUrl != null && googlePlayUrl!.isNotEmpty)
                        const SizedBox(width: 8),
                      if (googlePlayUrl != null && googlePlayUrl!.isNotEmpty)
                        Expanded(
                          child: _buildStoreButton(
                            context,
                            'Google Play',
                            Icons.android,
                            googlePlayUrl!,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.asset(
        iconPath,
        width: 28,
        height: 28,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Если изображение не загрузилось, показываем стандартную иконку
          return Icon(
            Icons.app_registration,
            color: AppColors.accent2,
            size: 28,
          );
        },
      ),
    );


  }

  Widget _buildYoutubeButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        _launchUrl(youtubeUrl!);
      },
      icon: const Icon(Icons.play_arrow_rounded),
      label: const Text('Watch Demo'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  Widget _buildStoreButton(BuildContext context, String storeName, IconData icon, String url) {
    return OutlinedButton.icon(
      onPressed: () {
        _launchUrl(url);
      },
      icon: Icon(icon),
      label: Text(storeName),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
    );
  }
  
  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

}