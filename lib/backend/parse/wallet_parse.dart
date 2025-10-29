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
import 'package:get/get.dart';
import '../../util/constant.dart';

class WalletParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  WalletParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getWallet() async {
    var response = await apiService.postPrivate(AppConstants.getWalletAmounts, {"id": sharedPreferencesManager.getString('uid')}, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getCurrencySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  String getCurrencySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }
}
