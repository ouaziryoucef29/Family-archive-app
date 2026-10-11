import 'package:flutter/material.dart';

class VoiceRecordingScreen extends StatefulWidget {
  const VoiceRecordingScreen({Key? key}) : super(key: key);

  @override
  _VoiceRecordingScreenState createState() => _VoiceRecordingScreenState();
}

class _VoiceRecordingScreenState extends State<VoiceRecordingScreen> {
  bool _isRecording = false;
  String _statusText = "اضغط على الميكروفون وابدأ بسرد قصتك...";

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording) {
        _statusText = "جاري التسجيل... تحدث بحرية، نحن نلتقط ذكرياتك.";
      } else {
        _statusText = "تم التسجيل بنجاح! جاري معالجة الصوت بالذكاء الاصطناعي...";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حكيم العائلة - تسجيل الذاكرة"),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_stories,
              size: 80,
              color: Colors.brown[400],
            ),
            const SizedBox(height: 30),
            Text(
              _statusText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: GestureDetector(
                onTap: _toggleRecording,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isRecording ? Colors.red : Colors.brown[600],
                    boxShadow: [
                      BoxShadow(
                        color: (_isRecording ? Colors.red : Colors.brown).withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              _isRecording ? "انقر لإيقاف التسجيل" : "انقر للبدء بالتحدث",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
