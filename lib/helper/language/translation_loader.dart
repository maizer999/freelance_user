// lib/helper/language/translation_loader.dart
import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class ApiTranslationLoader extends AssetLoader {
  final Map<String, dynamic> languages;

  ApiTranslationLoader({required this.languages});

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    // Logic to load translations based on the language map
    final jsonString = await rootBundle.loadString('assets/translations/${locale.languageCode}.json');
    return json.decode(jsonString);
  }
}
