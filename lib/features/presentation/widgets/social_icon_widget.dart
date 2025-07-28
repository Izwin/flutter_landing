import 'package:flutter/material.dart';

class SocialIconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const SocialIconWidget({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white70,
        onPressed: onPressed ?? () {},
      ),
    );
  }
} 