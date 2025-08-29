import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferencesProvider extends ChangeNotifier {
  SharedPreferences? _prefs;

  String _firstName = '';
  bool _isFirstTime = true;

  Map<String, int> _quizSettings = {
    'Mathematics': 5,
    'Sports': 5,
    'History': 5,
    'Animals': 5,
  };

  String get firstName => _firstName;
  bool get isFirstTime => _isFirstTime;
  Map<String, int> get quizSettings => _quizSettings;

  int getQuizQuestions(String category) {
    return _quizSettings[category] ?? 5;
  }

  Future<void> initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    if (_prefs == null) return;

    _firstName = _prefs!.getString('first_name') ?? '';
    _isFirstTime = _prefs!.getBool('is_first_time') ?? true;

    for (String category in _quizSettings.keys) {
      _quizSettings[category] = _prefs!.getInt('quiz_questions_$category') ?? 5;
    }

    notifyListeners();
  }

  Future<void> setFirstName(String name) async {
    if (_prefs == null) return;

    _firstName = name;
    await _prefs!.setString('first_name', name);
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    if (_prefs == null) return;

    _isFirstTime = false;
    await _prefs!.setBool('is_first_time', false);
    notifyListeners();
  }

  Future<void> setQuizQuestions(String category, int questions) async {
    if (_prefs == null) return;

    _quizSettings[category] = questions;
    await _prefs!.setInt('quiz_questions_$category', questions);
    notifyListeners();
  }

  Future<void> clearPreferences() async {
    if (_prefs == null) return;

    await _prefs!.clear();
    _firstName = '';
    _isFirstTime = true;
    _quizSettings = {
      'Math': 5,
      'Science': 5,
      'History': 5,
      'Geography': 5,
      'Literature': 5,
    };
    notifyListeners();
  }
}
