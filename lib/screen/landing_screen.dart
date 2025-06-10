import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_internet/screen/game_screen/e_commerce/ecommerce_level.dart';
import 'package:game_internet/screen/game_screen/media/media_level.dart';
import 'package:game_internet/screen/game_screen/situs_berita/situs_berita_level.dart';
import 'package:game_internet/widget/button.dart';

class LandingScreenPage extends StatefulWidget {
  const LandingScreenPage({Key? key}) : super(key: key);

  @override
  State<LandingScreenPage> createState() => _LandingScreenPageState();
}

class _LandingScreenPageState extends State<LandingScreenPage> {
  int _currentIndex = 0;

  final List<String> _messages = [
    'Halo! Kamu memasuki gerbang portal digital.',
    'Di depanmu terbentang tiga jalan.',
    'Media Sosial, Situs Berita, dan E-Commerce.',
    'Siapkah kamu menjaga data pribadimu dan menemukan informasi yang benar?',
    'Mari kita mulai petualanganmu di dunia internet!',
  ];

  bool _showBubble = true;
  String _characterImage = 'assets/images/character_talk.png';
  bool _hasTransitioned = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < _messages.length - 1) {
      setState(() => _currentIndex++);
    } else if (!_hasTransitioned) {
      _hasTransitioned = true;
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _showBubble = false;
          _characterImage =
              'assets/images/character_idle.png'; // Ganti ke gambar idle
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _messages.length - 1;

    if (isLast && !_hasTransitioned) {
      _nextPage();
    }

    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    final spriteWidth = screenW * 0.2;
    final spriteHeight = spriteWidth * (3 / 2);
    final bubbleWidth = screenW * 0.35;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/landing_bg.png',
                fit: BoxFit.fill,
              ),
            ),

            // Sprite dan Bubble
            Positioned(
              left: 40,
              bottom: screenH * 0.15,
              child: SizedBox(
                width: spriteWidth + bubbleWidth + 16,
                height: spriteHeight + 100,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Sprite
                    Positioned(
                      top: 200,
                      left: 0,
                      child: Image.asset(
                        _characterImage,
                        width: spriteWidth,
                        fit: BoxFit.fill,
                      ),
                    ),

                    // Bubble jika masih ditampilkan
                    if (_showBubble)
                      Positioned(
                        bottom: 80,
                        left: 0,
                        child: SizedBox(
                          width: bubbleWidth,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/bubble_left.png',
                                width: bubbleWidth,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    _messages[_currentIndex],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    maxLines: null,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Tombol
            Positioned(
              bottom: 24,
              left: 50,
              right: 0,
              child: Center(
                child: isLast && !_showBubble
                    ? Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          ModernButton(
                            gradientColors: const [
                              Color(0xFF00C6FF),
                              Color(0xFF0072FF),
                            ],
                            label: 'Situs Berita',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SitusBeritaLevel(),
                                ),
                              );
                            },
                          ),
                          ModernButton(
                            gradientColors: const [
                              Color(0xFFFFA500),
                              Color(0xFFFF4500),
                            ],
                            label: 'E-commerce',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EcommerceLevel(),
                                ),
                              );
                            },
                          ),
                          ModernButton(
                            gradientColors: const [
                              Color(0xFFDA70D6),
                              Color(0xFF800080),
                            ],
                            label: 'Media Sosial',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MediaLevel(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : ModernButton(
                        label: 'Next',
                        onPressed: _nextPage,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
