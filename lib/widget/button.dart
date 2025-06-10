import 'package:flutter/material.dart';

class ModernButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color> gradientColors;

  const ModernButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.gradientColors = const [
      Color(0xFF00C6FF),
      Color(0xFF0072FF),
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: gradientColors,
          ).createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: Colors.white.withOpacity(0.3),
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
