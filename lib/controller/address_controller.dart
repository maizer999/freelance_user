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
import '../backend/api/handler.dart';
import '../backend/model/address_model.dart';
import '../backend/parse/address_parse.dart';

import 'add_address_controller.dart';
import '../helper/router.dart';
import '../util/theme.dart';

class AddressController extends GetxController implements GetxService {
  final AddressParser parser;

  bool apiCalled = false;

  List<AddressModel> _addressList = <AddressModel>[];
  List<AddressModel> get addressList => _addressList;

  List<String> titles = ['Home'.tr, 'Work'.tr, 'Others'.tr];

  AddressController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    getSavedAddress();
  }

  Future<void> getSavedAddress() async {
    var param = {"id": parser.getUID()};

    Response response = await parser.getSavedAddress(param);
    debugPrint(response.bodyString);
    apiCalled = true;
    update();
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);

      var address = myMap['data'];
      _addressList = [];
      address.forEach((add) {
        AddressModel adds = AddressModel.fromJson(add);
        _addressList.add(adds);
      });
      debugPrint(addressList.length.toString());
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void onAddNewAddress() {
    Get.delete<AddAddressController>(force: true);
    Get.toNamed(AppRouter.getAddAddressRoute(), arguments: ['list', 'new']);
  }

  void updateAddress(int id) {
    Get.delete<AddAddressController>(force: true);
    Get.toNamed(AppRouter.getAddAddressRoute(), arguments: ['list', 'update', id]);
  }

  Future<void> deleteAddress(int id) async {
    Get.dialog(const SimpleDialog(children: [Center(child: CircularProgressIndicator(color: ThemeProvider.appColor))]));

    var param = {"id": id};
    Response response = await parser.deleteAddress(param);
    Get.back();

    if (response.statusCode == 200) {
      getSavedAddress();
    } else {
      debugPrint(response.bodyString);
      ApiChecker.checkApi(response);
    }
    update();
  }
}
