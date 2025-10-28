import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class NetworkInfo {
  final InternetConnectionChecker connectionChecker =
  InternetConnectionChecker.createInstance();

  Future<bool> get isConnected => connectionChecker.hasConnection;
}

final networkInfoProvider = Provider<NetworkInfo>(
      (ref) => NetworkInfo(),
);
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


