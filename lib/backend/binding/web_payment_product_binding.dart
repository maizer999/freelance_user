/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';
import '../../controller/web_payment_product_controller.dart';

class WebPaymentProductBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WebPaymentProductController(parser: Get.find()));
  }
}
