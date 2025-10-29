/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../backend/parse/tabs_parse.dart';
import 'product_cart_controller.dart';

class TabsController extends GetxController with GetTickerProviderStateMixin implements GetxService {
  final TabsParser parser;
  int currentIndex = 0;
  String title = '';
  int cartTotal = 0;
  late TabController tabController;
  TabsController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 5, vsync: this, initialIndex: currentIndex);
  }

  void updateCartValue() {
    cartTotal = Get.find<ProductCartController>().savedInCart.length;
    update();
  }

  void updateTabId(int id) {
    currentIndex = id;
    tabController.animateTo(currentIndex);
    update();
  }
}
