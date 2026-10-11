import 'package:supabase_flutter/supabase_flutter.dart';
import 'memory_model.dart';

class SupabaseService {
  // بيانات الاتصال السحابي (يتم وضعها بعد إنشاء مشروعك على Supabase)
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';

  // تهيئة الاتصال بقاعدة البيانات
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  static final SupabaseClient client = Supabase.instance.client;

  // دالة لحفظ ذكرى جديدة في السحاب
  static Future<bool> saveMemory(MemoryModel memory) async {
    try {
      await client.from('family_memories').insert(memory.toJson());
      return true;
    } catch (e) {
      print('خطأ في حفظ الذكرى سحابياً: $e');
      return false;
    }
  }

  // دالة لجلب جميع ذكريات العائلة المحفوظة
  static Future<List<MemoryModel>> fetchMemories() async {
    try {
      final response = await client
          .from('family_memories')
          .select()
          .order('date', ascending: false);
      
      return (response as List)
          .map((json) => MemoryModel.fromJson(json))
          .toList();
    } catch (e) {
      print('خطأ في استرجاع الذكريات: $e');
      return [];
    }
  }
}
