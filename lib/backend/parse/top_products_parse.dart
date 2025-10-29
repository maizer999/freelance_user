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
import '../../util/constant.dart';
import 'package:get/get.dart';

class TopProductsParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  TopProductsParse({required this.sharedPreferencesManager, required this.apiService});

  String getCurrenySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }

  String getCurrenySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  Future<Response> getHomeData(var body) async {
    return await apiService.postPublic(AppConstants.topProducts, body);
  }
}
