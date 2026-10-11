import 'package:flutter/material.dart';
import 'voice_recording_screen.dart';

void main() {
  runApp(const FamilyArchiveApp());
}

class FamilyArchiveApp extends StatelessWidget {
  const FamilyArchiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أرشيف العائلة',
      debugShowCheckedModeBanner: false,
      // دعم اللغة العربية والاتجاه من اليمين لليسر
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D6E63), // بني عتيق فخم
          brightness: Brightness.light,
        ),
        fontFamily: 'Cairo', // خط أنيق (يمكن إضافته لاحقاً)
        scaffoldBackgroundColor: const Color(0xFFFBF8F5), // خلفية دافئة تشبه الورق القديم
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5D4037),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ذاكرة العائلة - Family Archive"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.history_edu, size: 90, color: Color(0xFF8D6E63)),
            const SizedBox(height: 20),
            const Text(
              "احفظ قصص أجدادك، وصفات عائلتك، وذكريات طفولتك للأبد.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3E2723)),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VoiceRecordingScreen()),
                );
              },
              icon: const Icon(Icons.mic, color: Colors.white),
              label: const Text("بدء تسجيل ذكرى جديدة", style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6D4C41),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
