class MemoryModel {
  final String id;
  final String title;
  final String transcribedText;
  final String category; // مثل: (قصص الأجداد، وصفات الطبخ، ذكريات الطفولة)
  final DateTime date;

  MemoryModel({
    required this.id,
    required this.title,
    required this.transcribedText,
    required this.category,
    required this.date,
  });

  // تحويل البيانات لملف JSON لحفظها في قاعدة البيانات مستقبلاً
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'transcribedText': transcribedText,
      'category': category,
      'date': date.toIso8601String(),
    };
  }

  // قراءة البيانات من قاعدة البيانات
  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    return MemoryModel(
      id: json['id'],
      title: json['title'],
      transcribedText: json['transcribedText'],
      category: json['category'],
      date: DateTime.parse(json['date']),
    );
  }
}
