/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import '../api/api.dart';
import '../../helper/shared_pref.dart';

class WelcomeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  WelcomeParser({required this.sharedPreferencesManager, required this.apiService});
}
