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

class SearchParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SearchParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getSearchResult(var body) async {
    return await apiService.postPublic(AppConstants.searchQuery, body);
  }

  double getLat() {
    return sharedPreferencesManager.getDouble('lat') ?? 0.0;
  }

  double getLng() {
    return sharedPreferencesManager.getDouble('lng') ?? 0.0;
  }
}
