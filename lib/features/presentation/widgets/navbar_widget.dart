import 'package:devvibe_landing/core/theme/app_colors.dart';
import 'package:devvibe_landing/core/utils/context_utils.dart';
import 'package:devvibe_landing/features/presentation/widgets/animated_gradient_button.dart';
import 'package:devvibe_landing/features/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final Function()? onServicesPressed;
  final Function()? onContactPressed;
  final Function()? onPortfolioPressed;
  final Function()? onReviewsPressed;
  final Function()? onYoutubePressed;

  const NavbarWidget({
    super.key,
    this.onServicesPressed,
    this.onContactPressed,
    this.onPortfolioPressed,
    this.onReviewsPressed,
    this.onYoutubePressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(80),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: Offset(0, 4)
          ),
        ]
      ),
      child: context.isMobile ? _buildMobileNavbar(context) : _buildDesktopNavbar(context),
    );
  }

  Widget _buildDesktopNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogoWidget(),
        Row(
          children: [
            _buildNavItem('Services',onServicesPressed),
            _buildNavItem('Portfolio',onPortfolioPressed),
            _buildNavItem('Reviews',onReviewsPressed),
            _buildNavItem('Youtube',onYoutubePressed),
            const SizedBox(width: 16),
            AnimatedGradientButton(
              text: 'Get Started',
              onPressed: () => onContactPressed?.call(),
              width: 140,
              height: 40,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LogoWidget(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _showMobileMenu(context);
          },
        ),
      ],
    );
  }



  Widget _buildNavItem(String title, Function()? onTap,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primary.withOpacity(0.95),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMobileNavItem('Services',onServicesPressed),
              _buildMobileNavItem('Portfolio',onPortfolioPressed),
              _buildMobileNavItem('Reviews',onReviewsPressed),
              _buildMobileNavItem('YouTube',onYoutubePressed),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: AnimatedGradientButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pop(context);
                    onContactPressed?.call();
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileNavItem(String title, Function()? onTap) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
