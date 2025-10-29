/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freelance_user/util/constant.dart';
import 'package:freelance_user/util/theme.dart';
import 'package:freelance_user/util/translator.dart';
import 'package:get/get.dart';

import 'controller/cart_controller.dart';
import 'controller/product_cart_controller.dart';
import 'helper/init.dart';
import 'helper/router.dart';

late final ProviderContainer providerContainer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainBinding().dependencies();

  providerContainer = ProviderContainer();

  runApp(
    /// ✅ Wrap with UncontrolledProviderScope so Riverpod works
    UncontrolledProviderScope(
      container: providerContainer,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCart();
    Get.find<ProductCartController>().getCart();
    return GetMaterialApp(
      title: AppConstants.appName,
      color: ThemeProvider.appColor,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
      defaultTransition: Transition.native,
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(fontFamily: "regular"),
    );
  }
}
