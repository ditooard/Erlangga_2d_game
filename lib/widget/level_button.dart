import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final int level;
  final int stars;
  final bool unlocked;
  final VoidCallback onTap;

  const LevelButton({
    super.key,
    required this.level,
    required this.stars,
    required this.unlocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Gunakan gambar bintang dari aset
    final starIcons = List.generate(3, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Image.asset(
          index < stars
              ? 'assets/images/star_filled.png'
              : 'assets/images/star_empty.png',
          width: 50,
          height: 50,
        ),
      );
    });

    return GestureDetector(
      onTap: unlocked ? onTap : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: starIcons,
          ),
          Stack(
            alignment: Alignment.center,
            // Tambahan penting
            children: [
              Image.asset(
                unlocked
                    ? 'assets/images/medal_unlocked.png'
                    : 'assets/images/medal_locked.png',
                width: 90,
                height: 90,
                fit:
                    BoxFit.contain, // Agar gambar tidak memengaruhi layout teks
              ),
              Center(
                child: Text(
                  '$level',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: unlocked ? Colors.white : Colors.grey[600],
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
