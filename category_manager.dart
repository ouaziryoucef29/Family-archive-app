import 'package:flutter/material.dart';

class FamilyCategory {
  final String id;
  final String nameArabic;
  final IconData icon;
  final Color themeColor;

  const FamilyCategory({
    required this.id,
    required this.nameArabic,
    required this.icon,
    required this.themeColor,
  });
}

class CategoryManager {
  // قائمة الفئات الفخمة المجهزة لأرشيف العائلة
  static const List<FamilyCategory> categories = [
    FamilyCategory(
      id: 'ancestors_tales',
      nameArabic: 'حكايات الأجداد والبطولات',
      icon: Icons.menu_book,
      themeColor: Color(0xFF6D4C41), // بني عتيق
    ),
    FamilyCategory(
      id: 'kitchen_secrets',
      nameArabic: 'أسرار وصفات المطبخ',
      icon: Icons.restaurant_menu,
      themeColor: Color(0xFF8D6E63), // بني فاتح دافئ
    ),
    FamilyCategory(
      id: 'childhood_memories',
      nameArabic: 'ذكريات الطفولة والنشأة',
      icon: Icons.child_care,
      themeColor: Color(0xFFBCAAA4), // بيج هادئ
    ),
    FamilyCategory(
      id: 'happy_occasions',
      nameArabic: 'الأعياد والمناسبات السعيدة',
      icon: Icons.celebration,
      themeColor: Color(0xFFD7CCC8), // لون لؤلؤي دافئ
    ),
  ];

  // دالة لجلب الفئة بناءً على المعرف
  static FamilyCategory getCategoryById(String id) {
    return categories.firstWhere(
      (cat) => cat.id == id,
      orElse: () => categories.first,
    );
  }
}
