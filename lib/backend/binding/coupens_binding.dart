/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';
import '../../controller/coupens_controller.dart';

class CoupensBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => CoupensController(parser: Get.find()));
  }
}
