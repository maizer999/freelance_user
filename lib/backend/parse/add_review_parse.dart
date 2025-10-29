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

class AddReviewParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AddReviewParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getFreelancerByID(var body) async {
    var response = await apiService.postPublic(AppConstants.getFreelancerByID, body);
    return response;
  }

  Future<Response> getFreelancerReviews(var body) async {
    var response = await apiService.postPrivate(AppConstants.getFreelancerReviews, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> saveReview(var body) async {
    var response = await apiService.postPrivate(AppConstants.saveFreelancerReviews, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> updateFreelancerInfo(var body) async {
    var response = await apiService.postPrivate(AppConstants.updateFreelancerInfo, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }
}
