import 'package:flutter/material.dart';
import 'package:game_internet/widget/level_button.dart';

class EcommerceLevel extends StatelessWidget {
  const EcommerceLevel({super.key});

  final String backgroundAsset =
      'assets/images/ecommerce_bg.png'; // Ganti sesuai kebutuhan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              backgroundAsset,
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay (optional)

          // Level content
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const Text(
                    'E-COMMERCE : LEVELS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    // Gunakan Expanded untuk memberi GridView ruang vertikal yang fleksibel
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: List.generate(6, (index) {
                        int level = index + 1;
                        int stars = level == 1 ? 3 : (level == 2 ? 0 : 0);
                        bool unlocked = level <= 2;
                        return LevelButton(
                          level: level,
                          stars: stars,
                          unlocked: unlocked,
                          onTap: () {
                            if (unlocked) {
                              print("Go to level $level");
                            }
                          },
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Back button
          Positioned(
            top: 30,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
                    .withOpacity(0.9), // Warna latar belakang lingkaran
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
