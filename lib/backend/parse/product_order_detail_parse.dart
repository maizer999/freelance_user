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

class ProductOrderDetailParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ProductOrderDetailParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getOrderById(var body) async {
    var response = await apiService.postPrivate(AppConstants.getOrderById, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> onUpdateOrderStatus(var body) async {
    var response = await apiService.postPrivate(AppConstants.updateProductOrderStatus, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getCurrenySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }

  String getCurrenySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  String getToken() {
    return sharedPreferencesManager.getString('token') ?? '';
  }

  int getAdminId() {
    return sharedPreferencesManager.getInt('supportUID') ?? 0;
  }

  String getAdminName() {
    return sharedPreferencesManager.getString('supportName') ?? '';
  }
}
