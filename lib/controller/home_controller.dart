import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../backend/api/handler.dart';
import '../backend/model/banner_model.dart';
import '../backend/model/category_model.dart';
import '../backend/model/freelancer_model.dart';
import '../backend/model/product_model.dart';
import '../backend/parse/home_parse.dart';
import 'handyman_profile_controller.dart';
import 'product_cart_controller.dart';
import 'product_detail_controller.dart';
import 'product_listing_controller.dart';
import 'search_controller.dart';
import 'services_controller.dart';
import 'top_freelancers_controller.dart';
import 'top_products_controller.dart';
import '../helper/router.dart';
import '../util/constant.dart';
import '../util/toast.dart';
import 'package:url_launcher/url_launcher.dart';

// Custom print function to prepend the #PRINT tag
void printDebug(String message) {
  debugPrint("#PRINT: $message");
}

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;

  bool apiCalled = false;

  List<CategoryModel> _categoryList = <CategoryModel>[];
  List<CategoryModel> get categoryList => _categoryList;

  List<FreelancerModel> _freelancerList = <FreelancerModel>[];
  List<FreelancerModel> get freelancerList => _freelancerList;

  List<BannersModel> _bannersList = <BannersModel>[];
  List<BannersModel> get bannersList => _bannersList;

  List<ProductModel> _productList = <ProductModel>[];
  List<ProductModel> get productList => _productList;

  String title = '';
  String currencySymbol = AppConstants.defaultCurrencySymbol;
  String currencySide = AppConstants.defaultCurrencySide;
  bool haveData = false;

  HomeController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    currencySymbol = parser.getCurrenySymbol();
    currencySide = parser.getCurrenySide();
    title = parser.getAddressName();
    printDebug("HomeController initialized with title: $title");
    getHomeData();
  }

  Future<void> getHomeData() async {
    printDebug("getHomeData() called");

    var params = {"lat": parser.getLat(), "lng": parser.getLng()};
    printDebug("Requesting home data with params: $params");

    var response = await parser.getHomeData(params);
    apiCalled = true;

    if (response.statusCode == 200) {
      printDebug("API Call Successful - Status Code: 200");

      if (response.body != null) {
        Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
        printDebug("API Response: $myMap");

        if (myMap['data'] != null && myMap['categories'] != null && myMap['products'] != null) {
          var categories = myMap['categories'];
          var body = myMap['data'];
          var products = myMap['products'];
          var banners = myMap['banners'];
          haveData = myMap['havedata'];

          printDebug("Categories: $categories");
          printDebug("Freelancers: $body");
          printDebug("Products: $products");
          printDebug("Banners: $banners");

          // Cast and map categories to CategoryModel list
          _categoryList = (categories as List).map((element) => CategoryModel.fromJson(element)).toList();

          // Cast and map freelancers to FreelancerModel list
          _freelancerList = (body as List).map((element) => FreelancerModel.fromJson(element)).toList();

          // Cast and map products to ProductModel list
          _productList = (products as List).map((element) => ProductModel.fromJson(element)).toList();

          // Cast and map banners to BannersModel list
          _bannersList = (banners as List).map((element) => BannersModel.fromJson(element)).toList();

          printDebug("Banners count: ${_bannersList.length}");

          checkCartData();
        } else {
          printDebug("Missing necessary data in API response.");
        }
      } else {
        ApiChecker.checkApi(response);
        printDebug("API Response body is null.");
      }
    } else {
      ApiChecker.checkApi(response);
      printDebug("API Call Failed - Status Code: ${response.statusCode}");
    }

    update();
  }


  void checkCartData() {
    printDebug("Checking Cart Data...");
    for (var element in _productList) {
      if (Get.find<ProductCartController>().checkProductInCart(element.id as int) == true) {
        element.quantity = Get.find<ProductCartController>().getQuantity(element.id as int);
      } else {
        element.quantity = 0;
      }
    }
    printDebug("Cart data checked, updating quantities.");
    update();
  }

  void onSearch() {
    printDebug("Navigating to Search screen...");
    Get.delete<AppSearchController>(force: true);
    Get.toNamed(AppRouter.getSearchRoute());
  }

  void onCategory(int id, String name) {
    printDebug("Navigating to Services screen with category ID: $id, Name: $name");
    Get.delete<ServicesController>(force: true);
    Get.toNamed(AppRouter.getServicesRoute(), arguments: [id, name]);
  }

  void onHandymanProfile(int id, String name) {
    printDebug("Navigating to Handyman Profile with ID: $id, Name: $name");
    Get.delete<HandymanProfileController>(force: true);
    Get.toNamed(AppRouter.getHandymanProfileRoute(), arguments: [id, name]);
  }

  void onProduct(int id) {
    printDebug("Navigating to Product Detail screen with Product ID: $id");
    Get.delete<ProductDetailController>(force: true);
    Get.toNamed(AppRouter.getProductDetailRoute(), arguments: [id]);
  }

  void addToCart(int index) {
    printDebug("Adding Product ${_productList[index].id} to Cart.");
    if (Get.find<ProductCartController>().savedInCart.isEmpty) {
      _productList[index].quantity = 1;
      Get.find<ProductCartController>().addItem(_productList[index]);
      checkCartData();
      update();
    } else {
      int freelancerId = Get.find<ProductCartController>().getFreelancerId(_productList[index]);

      if (freelancerId == _productList[index].freelacerId) {
        _productList[index].quantity = 1;
        Get.find<ProductCartController>().addItem(_productList[index]);
        checkCartData();
        update();
      } else {
        showToast('We already have product with other freelancer'.tr);
        printDebug("Cannot add product with a different freelancer.");
        update();
      }
    }
  }

  void updateProductQuantity(int index) {
    printDebug("Increasing quantity of Product ID: ${_productList[index].id}");
    _productList[index].quantity = _productList[index].quantity + 1;
    Get.find<ProductCartController>().addQuantity(_productList[index]);
    checkCartData();
    update();
  }

  void updateProductQuantityRemove(int index) {
    printDebug("Decreasing quantity of Product ID: ${_productList[index].id}");
    if (_productList[index].quantity == 1) {
      _productList[index].quantity = 0;
      Get.find<ProductCartController>().removeItem(_productList[index]);
    } else {
      _productList[index].quantity = _productList[index].quantity - 1;
      Get.find<ProductCartController>().addQuantity(_productList[index]);
    }
    checkCartData();
    update();
  }

  void onBannerClick(int type, String value) {
    printDebug("Banner clicked. Type: $type, Value: $value");
    if (type == 1) {
      printDebug('category');
      Get.delete<ServicesController>(force: true);
      Get.toNamed(AppRouter.getServicesRoute(), arguments: [int.parse(value), 'Offers']);
    } else if (type == 2) {
      printDebug('single freelancer');
      Get.delete<HandymanProfileController>(force: true);
      Get.toNamed(AppRouter.getHandymanProfileRoute(), arguments: [int.parse(value), 'Top Freelancer']);
    } else if (type == 3) {
      printDebug('multiple freelancer');
      Get.delete<TopFreelancersController>(force: true);
      Get.toNamed(AppRouter.getTopFreelancerRoutes(), arguments: [value]);
    } else if (type == 4) {
      printDebug('product category');
      Get.delete<ProductListingController>(force: true);
      Get.toNamed(AppRouter.getProductListingRoute(), arguments: [type, 'Offers']);
    } else if (type == 5) {
      printDebug('single product');
      Get.delete<ProductDetailController>(force: true);
      Get.toNamed(AppRouter.getProductDetailRoute(), arguments: [int.parse(value), 'Offers']);
    } else if (type == 6) {
      printDebug('multiple products');
      Get.delete<TopProductsController>(force: true);
      Get.toNamed(AppRouter.getTopProductsRoutes(), arguments: [value]);
    } else {
      printDebug('external url');
      launchInBrowser(value);
    }
  }

  Future<void> launchInBrowser(var link) async {
    printDebug("Launching external URL: $link");
    var url = Uri.parse(link);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw '${'Could not launch'.tr} $url';
    }
  }
}
