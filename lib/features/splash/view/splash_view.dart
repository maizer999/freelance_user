// lib/features/user_management/splash/views/splash_view.dart
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  final Widget child;
  final Function(List<String>) onInitialized;

  const SplashView({super.key, required this.child, required this.onInitialized});

  @override
  Widget build(BuildContext context) {
    // Simulating splash screen initialization (e.g., language loading or API initialization)
    Future.delayed(const Duration(seconds: 2), () {
      onInitialized(['en', 'ar']); // Provide the supported languages here
    });

    return Scaffold(
      body: Center(
        child: child, // This will show the SplashImageView widget
      ),
    );
  }
}
