/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';
import '../backend/parse/welcome_parse.dart';

class WelcomeController extends GetxController implements GetxService {
  final WelcomeParser parser;
  String title = '';
  WelcomeController({required this.parser});
}
