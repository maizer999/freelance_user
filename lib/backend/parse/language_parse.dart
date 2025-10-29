/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import '../../util/constant.dart';
import '../api/api.dart';
import '../../helper/shared_pref.dart';

class LanguageParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LanguageParser({required this.sharedPreferencesManager, required this.apiService});

  void saveLanguage(String code) {
    sharedPreferencesManager.putString('language', code);
  }

  String getDefault() {
    return sharedPreferencesManager.getString('language') ?? AppConstants.defaultLanguageApp;
  }
}
