//This class holds static references to API endpoints used throughout the application.

import 'app_strings.dart';

bool kIsProduction = true;

class ApiEndPoints {

  static const String baseURL_PROD =
      "https://apigw.tabadul.sa/tabadul/pmis/mobileapi";

  static String localizationByMap =
      "$baseURL_PROD/lookupmaster/localization/locale-map";

  static String downloadDocument = "$baseURL_PROD/mawani-file/file/download-file";

  static const String baseImageURL = "https://pmis.fasah.sa";

}
