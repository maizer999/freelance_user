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
import 'package:image_picker/image_picker.dart';

class EditProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  EditProfileParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getUserByID(var body) async {
    var response = await apiService.postPrivate(AppConstants.getUserByID, body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> uploadImage(XFile data) async {
    return await apiService.uploadFiles(AppConstants.uploadImage, [MultipartBody('image', data)]);
  }

  Future<Response> onUpdateInfo(var body) async {
    var response = await apiService.postPrivate(AppConstants.updateInfo, body, sharedPreferencesManager.getString('token') ?? '');
    sharedPreferencesManager.putString('cover', body['cover']);
    sharedPreferencesManager.putString('first_name', body['first_name']);
    sharedPreferencesManager.putString('last_name', body['last_name']);
    return response;
  }

  String getUID() {
    return sharedPreferencesManager.getString('uid') ?? '0';
  }
}
