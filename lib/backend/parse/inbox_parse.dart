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
import 'package:get/get.dart';

class InboxParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  InboxParser({required this.sharedPreferencesManager, required this.apiService});

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  Future<Response> getChatConversion(var uid) async {
    return await apiService.postPrivate(AppConstants.getChatConversionList, {'id': uid}, sharedPreferencesManager.getString('token') ?? '');
  }

  bool haveLoggedIn() {
    return sharedPreferencesManager.getString('uid') != '' && sharedPreferencesManager.getString('uid') != null ? true : false;
  }
}
