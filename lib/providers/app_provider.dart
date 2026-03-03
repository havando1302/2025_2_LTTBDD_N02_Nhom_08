import 'package:flutter/material.dart';

//Lưu trạng thái ngôn ngữ (vi/en)
class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('vi');
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  void toggle() {
    if (_locale.languageCode == 'vi') {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('vi');
    }
    notifyListeners();
  }
}
