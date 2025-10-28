import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/shared_pref_constants.dart';
import '../user_service/model/user_access_permission.dart';

class SystemPreferencesHelper {
  Future<Locale?> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('locale') ?? 'en';
    return Locale(languageCode);
  }

  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }

  static Future<void> saveUserData(
    UserDetailsData data,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(data);
    prefs.setString(SharedPrefConstants.userData, jsonString);
  }

  static Future<UserDetailsData?> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(SharedPrefConstants.userData) ?? null;
    // Map<String, dynamic> json = jsonDecode(jsonString);
    if (jsonString != null) {
      var firstDecode = jsonDecode(jsonString);
      var secondDecode = jsonDecode(firstDecode);
      Map<String, dynamic> json = secondDecode;
      return UserDetailsDataMapper.fromMap(json);
    } else
      return null;
  }

  static Future<void> savePermissionList(
    List<UserAccessList> myList,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(myList.map((e) => e.toJson()).toList());
    prefs.setString(SharedPrefConstants.permissionList, jsonString);
  }

  static Future<List<UserAccessList>> getPermissionList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<UserAccessList> list = [];
    var jsonString = prefs.getString(SharedPrefConstants.permissionList) ?? "";
    if (jsonString.isNotEmpty) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      for (var item in jsonList) {
        list.add(UserAccessListMapper.fromJson(item));
      }
      jsonList.map((object) =>
          list.add(UserAccessListMapper.fromJson(jsonDecode(object))));
    }
    return list;
  }

  static Future<void> saveLocalizationData(
    Map<String, dynamic> data,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(data);
    prefs.setString(SharedPrefConstants.localizationData, jsonString);
  }

  static Future<Map<String, dynamic>?> getLocalizationData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(SharedPrefConstants.localizationData);
    if (data == null) {
      return null;
    }
    Map<String, dynamic>? map = jsonDecode(data);
    return map;
  }

  static Future<void> setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefConstants.languageCode, languageCode);
  }

  static Future<String?> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefConstants.languageCode);
  }

  static Future<void> setStakeHolderCode(String stakeHolder) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefConstants.stakeHolder, stakeHolder);
  }

  static Future<String?> getStakeHolderCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefConstants.stakeHolder);
  }

  static Future<UserType> getUserTypeEnum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserType.getByCode(
        prefs.getString(SharedPrefConstants.stakeHolder) ?? "");
  }

  static Future<void> setPortId(int portId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPrefConstants.portId, portId);
  }

  static Future<int?> getPortId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefConstants.portId);
  }

  static Future<void> setBiometricLogin(bool biometricLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefConstants.useBiometric, biometricLogin);
  }

  static Future<bool?> getBiometricLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefConstants.useBiometric);
  }

  static Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final useBiometric = prefs.getBool(SharedPrefConstants.useBiometric);
    await prefs.clear();
    if (useBiometric != null) {
      await prefs.setBool(SharedPrefConstants.useBiometric, useBiometric);
    }
  }
}
