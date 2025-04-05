import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  static const String _languageKey = 'language_code';
  late SharedPreferences _prefs;
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    final String? languageCode = _prefs.getString(_languageKey);
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> setLanguage(String languageCode) async {
    _locale = Locale(languageCode);
    await _prefs.setString(_languageKey, languageCode);
    notifyListeners();
  }

  bool isLanguageSelected(String languageCode) {
    return _locale.languageCode == languageCode;
  }

  String get currentLanguage => _locale.languageCode;

  List<Locale> get supportedLocales => const [
        Locale('en'),
        Locale('es'),
        // Add more supported locales
      ];

  Map<String, String> get languageNames => {
        'en': 'English',
        'es': 'Español',
        // Add more language names
      };

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLanguage() {
    _locale = _locale == const Locale('en') ? const Locale('es') : const Locale('en');
    notifyListeners();
  }
} 