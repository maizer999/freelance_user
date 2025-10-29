/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter V6
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2025-present initappz.
*/
import 'package:flutter/material.dart';
import '../backend/parse/choose_location_parse.dart';
import 'account_controller.dart';
import 'app_page_controller.dart';
import 'history_controller.dart';
import 'home_controller.dart';
import 'inbox_controller.dart';
import 'product_history_controller.dart';
import '../helper/router.dart';
import '../util/theme.dart';
import '../util/toast.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

// class ChooseLocationController extends GetxController implements GetxService {
//   final ChooseLocationParser parser;
//
//   ChooseLocationController({required this.parser});
//
//   void getLocation() async {
//     debugPrint("getLocation() called");  // Log function call
//     Get.dialog(
//       SimpleDialog(
//         children: [
//           Row(
//             children: [
//               const SizedBox(width: 30),
//               const CircularProgressIndicator(color: ThemeProvider.appColor),
//               const SizedBox(width: 30),
//               SizedBox(child: Text("Featching Location".tr, style: const TextStyle(fontFamily: 'bold'))),
//             ],
//           )
//         ],
//       ),
//       barrierDismissible: false,
//     );
//     _determinePosition().then((value) async {
//       debugPrint("Location determined: ${value.toString()}");  // Log position
//       Get.back();
//
//       ///// test /////
//       // parser.saveLatLng(21.7645, 72.1519, 'Dummy Address'); // Test location
//       ///// test /////
//
//       /// live ///
//       List<Placemark> newPlace = await placemarkFromCoordinates(value.latitude, value.longitude);
//       Placemark placeMark = newPlace[0];
//       String name = placeMark.name.toString();
//       String subLocality = placeMark.subLocality.toString();
//       String locality = placeMark.locality.toString();
//       String administrativeArea = placeMark.administrativeArea.toString();
//       String postalCode = placeMark.postalCode.toString();
//       String country = placeMark.country.toString();
//       String address = "$name,$subLocality,$locality,$administrativeArea,$postalCode,$country";
//       debugPrint("Address found: $address");  // Log full address
//       parser.saveLatLng(value.latitude, value.longitude, address);
//
//       /// live ///
//       Get.delete<HomeController>(force: true);
//       Get.delete<AccountController>(force: true);
//       Get.delete<HistoryController>(force: true);
//       Get.delete<InboxController>(force: true);
//       Get.delete<ProductHistoryController>(force: true);
//       debugPrint("Controllers deleted and navigating to next screen");
//       Get.offAndToNamed(AppRouter.getTabsRoute());
//     }).catchError((error) async {
//       debugPrint("Error: ${error.toString()}");  // Log any errors
//       Get.back();
//       showToast(error.toString());
//       await Geolocator.openLocationSettings();
//     });
//   }
//
//   Future<Position> _determinePosition() async {
//     debugPrint("_determinePosition() called");  // Log function call
//     bool serviceEnabled;
//     LocationPermission permission;
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       debugPrint("Location services are disabled.");
//       return Future.error('Location services are disabled.'.tr);
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       debugPrint("Location permission denied, requesting permission");
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         debugPrint("Location permission still denied");
//         return Future.error('Location permissions are denied'.tr);
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       debugPrint("Location permission permanently denied");
//       return Future.error('Location permissions are permanently denied, we cannot request permissions.'.tr);
//     }
//     Position position = await Geolocator.getCurrentPosition();
//     debugPrint("Current position: ${position.latitude}, ${position.longitude}");  // Log obtained position
//     return position;
//   }
//
//   void onCategory() {
//     debugPrint("onCategory() called");  // Log function call
//     Get.toNamed(AppRouter.getCheckoutRoute());
//   }
// }
//
//
// /*
//   Authors : initappz (Rahul Jograna)
//   Website : https://initappz.com/
//   App Name : Handy Service Full App Flutter V6
//   This App Template Source code is licensed as per the
//   terms found in the Website https://initappz.com/license
//   Copyright and Good Faith Purchasers © 2025-present initappz.
// */
// import 'package:get/get.dart';
// import '../backend/parse/choose_location_parse.dart';
// import 'account_controller.dart';
// import 'app_page_controller.dart';
// import 'history_controller.dart';
// import 'home_controller.dart';
// import 'inbox_controller.dart';
// import 'product_history_controller.dart';
// import '../helper/router.dart';

class ChooseLocationController extends GetxController implements GetxService {
  final ChooseLocationParser parser;

  ChooseLocationController({required this.parser});

  /// ✅ Static Location: Amman, Jordan
  final double staticLat = 31.963158;
  final double staticLng = 35.930359;
  final String staticAddress = "Amman, Jordan";

  /// ✅ Directly use static location and continue
  void getLocation() async {
    // Save static location instead of fetching GPS
    parser.saveLatLng(staticLat, staticLng, staticAddress);

    // Remove old controllers (optional - keeps memory clean)
    Get.delete<HomeController>(force: true);
    Get.delete<AccountController>(force: true);
    Get.delete<HistoryController>(force: true);
    Get.delete<InboxController>(force: true);
    Get.delete<ProductHistoryController>(force: true);

    // Go to Tabs / Home
    Get.offAndToNamed(AppRouter.getTabsRoute());
  }

  /// If user wants to manually choose location (optional)
  void onCategory() {
    Get.toNamed(AppRouter.getCheckoutRoute());
  }
}
