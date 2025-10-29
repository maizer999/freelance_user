/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:get/get.dart';
import '../../controller/account_controller.dart';
import '../../controller/app_page_controller.dart';
import '../../controller/history_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/inbox_controller.dart';
import '../../controller/product_category_controller.dart';
import '../../controller/tabs_controller.dart';

class TabsBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => TabsController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => HistoryController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => ProductCategoryController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => InboxController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => AccountController(parser: Get.find()), fenix: true);
  }
}
