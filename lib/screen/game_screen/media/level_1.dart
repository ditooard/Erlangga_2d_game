import 'package:flutter/material.dart';

class MediaSosialPage extends StatefulWidget {
  @override
  _MediaSosialPageState createState() => _MediaSosialPageState();
}

class _MediaSosialPageState extends State<MediaSosialPage> {
  String feedbackMessage = '';
  int score = 0;

  Color color = Colors.black;

  void handleChoice(int choice) {
    setState(() {
      if (choice == 1) {
        feedbackMessage =
            '⚠️ Waspada! Itu hoaks phishing. Data pribadimu bocor.';
        score -= 5;
      } else if (choice == 2) {
        feedbackMessage =
            '👍 Bagus, kamu konfirmasi dulu. Ternyata itu akun palsu.';
        score += 2;
      } else if (choice == 3) {
        feedbackMessage = '✅ Bijak! Kamu memblok dan melaporkan.';
        score += 3;
      }
    });

    // Menampilkan dialog umpan balik
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          title: Text(
            'Umpan Balik',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: color),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                feedbackMessage,
                style: TextStyle(fontSize: 16, color: color),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('OK', style: TextStyle(color: Colors.blue)),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/media_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                // Gambar ilustrasi kiri
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/media_lv_1.png',
                        fit: BoxFit.fitHeight,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),

                // Konten kanan
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Level 1: Media Sosial',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Kamu mendapat DM dari "teman baru" berisi tautan kuis berhadiah smartphone.',
                            style: TextStyle(fontSize: 16, color: color),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Apa yang akan kamu lakukan?',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () => handleChoice(1),
                            child: Text('Klik link dan isi data',
                                style: TextStyle(color: color)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              minimumSize: Size(double.infinity, 48),
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => handleChoice(2),
                            child: Text('Tanya detail ke teman',
                                style: TextStyle(color: color)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              minimumSize: Size(double.infinity, 48),
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => handleChoice(3),
                            child: Text('Tandai sebagai spam dan blok',
                                style: TextStyle(color: color)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              minimumSize: Size(double.infinity, 48),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
