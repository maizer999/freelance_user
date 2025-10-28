import 'package:flutter/material.dart';
import 'package:freelance_user/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This global variable used for global working on ui elements where
/// may be context is not present
final navigatorKey = GlobalKey<NavigatorState>();

/// This provider used for storing router
/// and can be acessed by reading it using ProviderRef/WidgetRef
final autoRouterProvider = Provider.autoDispose<AppRouter>(
  (ref) => AppRouter(navigatorKey: navigatorKey),
  name: 'autoRouterProvider',
);
