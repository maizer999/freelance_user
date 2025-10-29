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

class FavoriteParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  FavoriteParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMyList(var param) async {
    return await apiService.postPrivate(AppConstants.getMyFavList, param, sharedPreferencesManager.getString('token') ?? '');
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  double getLat() {
    return sharedPreferencesManager.getDouble('lat') ?? 0.0;
  }

  double getLng() {
    return sharedPreferencesManager.getDouble('lng') ?? 0.0;
  }

  String getCurrencyCode() {
    return sharedPreferencesManager.getString('currencyCode') ?? AppConstants.defaultCurrencyCode;
  }

  String getCurrencySide() {
    return sharedPreferencesManager.getString('currencySide') ?? AppConstants.defaultCurrencySide;
  }

  String getCurrencySymbol() {
    return sharedPreferencesManager.getString('currencySymbol') ?? AppConstants.defaultCurrencySymbol;
  }
}
