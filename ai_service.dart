import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService {
  // ضع مفتاح الـ API الخاص بـ OpenAI هنا
  static const String _apiKey = 'YOUR_OPENAI_API_KEY';

  // دالة إرسال الصوت وتفريغه إلى نص عبر Whisper API
  static Future<String?> transcribeAudio(File audioFile) async {
    try {
      var uri = Uri.parse('https://api.openai.com/v1/audio/transcriptions');
      
      var request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $_apiKey'
        ..fields['model'] = 'whisper-1'
        ..fields['language'] = 'ar' // دعم اللهجات العربية
        ..files.add(await http.MultipartFile.fromPath('file', audioFile.path));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        String transcribedText = data['text'];
        return transcribedText;
      } else {
        print('فشل الاتصال: ${response.body}');
        return null;
      }
    } catch (e) {
      print('حدث خطأ: $e');
      return null;
    }
  }
}
