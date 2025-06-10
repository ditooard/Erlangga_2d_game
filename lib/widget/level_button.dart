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
    final starIcons = List.generate(3, (index) {
      return Icon(
        Icons.star,
        size: 16,
        color: index < stars ? Colors.yellow : Colors.white,
      );
    });

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: starIcons,
          ),
          const SizedBox(height: 5),
          CircleAvatar(
            radius: 25,
            backgroundColor: unlocked ? Colors.orange : Colors.grey,
            child: Text(
              '$level',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
