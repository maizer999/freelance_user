/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../backend/api/handler.dart';
import '../backend/model/language_model.dart';
import '../backend/model/settings_model.dart';
import '../backend/model/support_model.dart';
import '../backend/parse/splash_parse.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreenController extends GetxController implements GetxService {
  final SplashScreenParse parser;
  late LanguageModel _defaultLanguage;
  LanguageModel get defaultLanguage => _defaultLanguage;
  late SettingsModel _settingsModel;
  SettingsModel get settinsModel => _settingsModel;

  late SupportModel _supportModel;
  SupportModel get supportModel => _supportModel;
  SplashScreenController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    if (!kIsWeb) {
      checkNotificationPermission();
      // FirebaseMessaging.instance.getToken().then((value) {
      //   debugPrint(value.toString());
      //   parser.saveDeviceToken(value.toString());
      // });
    }
  }

  Future<void> checkNotificationPermission() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    firebaseMessaging.getToken().then((value) async {
      String? token = value;
      parser.saveDeviceToken(value.toString());
      // Response response = await parser.saveDeviceToken(token);
      // debugPrint(response.bodyString);
      debugPrint('/////////////////////////');
      debugPrint(token);
      debugPrint('/////////////////////////');
    });
  }

  Future<bool> initSharedData() {
    return parser.initAppSettings();
  }

  Future<bool> getConfigData() async {
    Response response = await parser.getAppSettings();
    bool isSuccess = false;
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['data'] != null) {
        dynamic body = myMap["data"];
        if (body['settings'] != null && body['support'] != null) {
          SettingsModel appSettingsInfo = SettingsModel.fromJson(body['settings']);
          _settingsModel = appSettingsInfo;

          SupportModel supportModelInfo = SupportModel.fromJson(body['support']);
          _supportModel = supportModelInfo;

          parser.saveBasicInfo(
              appSettingsInfo.currencyCode,
              appSettingsInfo.currencySide,
              appSettingsInfo.currencySymbol,
              appSettingsInfo.smsName,
              appSettingsInfo.userVerifyWith,
              appSettingsInfo.userLogin,
              appSettingsInfo.email,
              appSettingsInfo.name,
              appSettingsInfo.deliveryType,
              appSettingsInfo.deliveryCharge,
              appSettingsInfo.tax,
              appSettingsInfo.logo,
              '${supportModelInfo.firstName!} ${supportModelInfo.lastName!}',
              supportModelInfo.id,
              appSettingsInfo.mobile.toString(),
              appSettingsInfo.allowDistance);
          isSuccess = true;
        } else {
          isSuccess = false;
        }
      }
    } else {
      ApiChecker.checkApi(response);
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  String getLanguageCode() {
    return parser.getLanguagesCode();
  }
}
