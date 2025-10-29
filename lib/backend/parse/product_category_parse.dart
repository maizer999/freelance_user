/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';
import '../api/api.dart';
import '../../helper/shared_pref.dart';
import '../../util/constant.dart';

class ProductCategoryParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductCategoryParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getAllProductCategories() async {
    var response = await apiService.getPublic(AppConstants.getAllProductCategories);
    return response;
  }

  bool isLogin() {
    return sharedPreferencesManager.getString('uid') != '' && sharedPreferencesManager.getString('uid') != null ? true : false;
  }

  String getCurrenySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }

  String getCurrenySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }
}
