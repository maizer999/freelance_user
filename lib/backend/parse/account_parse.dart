/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';

import '../../helper/shared_pref.dart';
import '../../util/constant.dart';
import '../api/api.dart';

class AccountParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AccountParser({required this.sharedPreferencesManager, required this.apiService});

  String getUserCover() {
    return sharedPreferencesManager.getString('cover') ?? '';
  }

  String getUserFirstName() {
    return sharedPreferencesManager.getString('first_name') ?? '';
  }

  String getUserLastName() {
    return sharedPreferencesManager.getString('last_name') ?? '';
  }

  String getUserEmail() {
    return sharedPreferencesManager.getString('email') ?? '';
  }

  bool isLogin() {
    return sharedPreferencesManager.getString('uid') != '' && sharedPreferencesManager.getString('uid') != null ? true : false;
  }

  Future<Response> logout() async {
    return await apiService.logout(AppConstants.logout, sharedPreferencesManager.getString('token') ?? '');
  }

  void clearAccount() {
    sharedPreferencesManager.clearKey('first_name');
    sharedPreferencesManager.clearKey('last_name');
    sharedPreferencesManager.clearKey('token');
    sharedPreferencesManager.clearKey('uid');
    sharedPreferencesManager.clearKey('email');
    sharedPreferencesManager.clearKey('cover');
  }
}
