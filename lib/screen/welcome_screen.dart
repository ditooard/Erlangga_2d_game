import 'package:flutter/material.dart';
import 'package:game_internet/screen/landing_screen.dart';
import 'package:game_internet/screen/setting_screen.dart';
import 'package:game_internet/widget/button.dart';

class WelcomeScreenPage extends StatelessWidget {
  const WelcomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/welcome_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          // Content positioned at the bottom
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(
                  bottom: 25, right: 30), // Margin from the bottom
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ModernButton(
                    gradientColors: const [Colors.red, Colors.yellow],
                    label: 'Start Game',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LandingScreenPage(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ModernButton(
                    gradientColors: const [Colors.blue, Colors.green],
                    label: 'Settings',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SettingsPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
