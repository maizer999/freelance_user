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
import '../../util/constant.dart';

class WebPaymentProductParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  WebPaymentProductParse({required this.sharedPreferencesManager, required this.apiService});

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  Future<Response> sendNotification(var body) async {
    var response = await apiService.postPrivate(AppConstants.sendNotification, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> createProductOrder(var body) async {
    var response = await apiService.postPrivate(AppConstants.createProductOrdedr, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> verifyPurchase(var payKey) async {
    return await apiService.getPrivate(AppConstants.verifyRazorPayments + payKey, sharedPreferencesManager.getString('token') ?? '');
  }

  String getName() {
    String firstName = sharedPreferencesManager.getString('firstName') ?? '';
    String lastName = sharedPreferencesManager.getString('lastName') ?? '';
    return '$firstName $lastName';
  }

  String getEmail() {
    return sharedPreferencesManager.getString('email') ?? '';
  }

  String getSupportEmail() {
    return sharedPreferencesManager.getString('supportEmail') ?? '';
  }

  String getSupportPhone() {
    return sharedPreferencesManager.getString('supportPhone') ?? '';
  }
}
