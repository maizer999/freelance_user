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

class TopFreelancersParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  TopFreelancersParse({required this.sharedPreferencesManager, required this.apiService});

  String getCurrencyCode() {
    return sharedPreferencesManager.getString('currencyCode') ?? AppConstants.defaultCurrencyCode;
  }

  String getCurrencySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  String getCurrencySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }

  Future<Response> getMyList(var param) async {
    return await apiService.postPublic(AppConstants.topFreelancer, param);
  }

  double getLat() {
    return sharedPreferencesManager.getDouble('lat') ?? 0.0;
  }

  double getLng() {
    return sharedPreferencesManager.getDouble('lng') ?? 0.0;
  }
}
