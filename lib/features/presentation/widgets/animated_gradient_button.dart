import 'package:flutter/material.dart';

class AnimatedGradientButton extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final bool isOutlined;
  
  const AnimatedGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.gradientColors = const [Color(0xFFFF81FF), Color(0xFF51FAAA)],
    this.width = double.infinity,
    this.height = 50,
    this.isOutlined = false,
  });

  @override
  State<AnimatedGradientButton> createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {widget.onPressed?.call();},
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: widget.isOutlined 
                    ? null 
                    : LinearGradient(
                        colors: widget.gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                border: widget.isOutlined 
                    ? Border.all(
                        color: widget.gradientColors[0],
                        width: 2,
                      )
                    : null,
                boxShadow: _isHovered 
                    ? [
                        BoxShadow(
                          color: widget.gradientColors[0].withOpacity(0.3),
                          blurRadius: 8 + (_animation.value * 8),
                          spreadRadius: 2 + (_animation.value * 2),
                        ),
                        BoxShadow(
                          color: widget.gradientColors[1].withOpacity(0.3),
                          blurRadius: 8 + (_animation.value * 8),
                          spreadRadius: 2 + (_animation.value * 2),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.isOutlined 
                        ? widget.gradientColors[0] 
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
} 