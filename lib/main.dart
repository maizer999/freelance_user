import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freelance_user/routes/auto_route_observer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freelance_user/routes/auto_route_observer.dart';
import 'package:freelance_user/routes/auto_router_provider.dart';
import 'package:freelance_user/theme/theme.dart';
import 'package:freelance_user/widgets/common_text_widget.dart';
import 'package:gif_view/gif_view.dart';

import 'constants/app_colors.dart';
import 'constants/app_images.dart';
import 'constants/app_sizes.dart';
import 'constants/app_strings.dart';
import 'features/splash/view/splash_view.dart';
import 'helper/language/language_listner_widget.dart';
import 'helper/language/translation_loader.dart';
import 'helper/system_preferences_helper.dart';
import 'network/network_info.dart';

late final ProviderContainer providerContainer;

void main() async {
  // Set up custom HTTP overrides
  HttpOverrides.global = MyHttpOverrides();

  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase (if needed)
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // Set up error handling and crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Initialize EasyLocalization
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();

  // Get the saved language code
  String? lang = await SystemPreferencesHelper.getLanguageCode();

  // Initialize provider container (for Riverpod state management)
  providerContainer = ProviderContainer();

  // Initialize encryption helpers or services
  // await EncryptionHelper.initialize();

  // Run the app
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // Define the design resolution
        minTextAdapt: true,
        splitScreenMode: true,
        enableScaleText: () => true,
        enableScaleWH: () => false,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView(
            child: SplashImageView(),
            onInitialized: (languages) {
              // Convert List<String> languages to Map<String, dynamic>
              final Map<String, dynamic> languageMap = {
                'languages': languages,
              };

              runApp(
                UncontrolledProviderScope(
                  container: providerContainer,
                  child: EasyLocalization(
                    key: const ValueKey("Easy Loaded Data"),
                    supportedLocales: const [
                      Locale('en'), // English
                      Locale('ar'), // Arabic
                    ],
                    path: 'assets/translations', // Path to translations
                    fallbackLocale: Locale(lang ?? "en"), // Fallback to English if no language is set
                    assetLoader: ApiTranslationLoader(
                      languages: languageMap, // Now passing a Map instead of List
                    ),
                    child: MyApp(), // Start the main app after initialization
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(autoRouterProvider); // Watch the router provider
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName, // App name from your constants
      theme: AppTheme.lightTheme, // Define theme for the app
      routerConfig: appRouter.config( // Set the route configuration
        navigatorObservers: () => [
          RouterObserver(),
          FirebaseAnalyticsObserver(analytics: analytics), // Analytics observer
        ],
      ),
      supportedLocales: context.supportedLocales, // Supported locales for translation
      locale: context.locale, // Current locale
      localizationsDelegates: [
        ...context.localizationDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return LanguageListener(
          child: child!,
        );
      },
    );
  }
}


class SplashImageView extends StatelessWidget {
  const SplashImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundSplash),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppSizes.height120,
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      child:
                      Image.asset(AppImages.mawaniIcon, fit: BoxFit.fill),
                    ),
                    CommonTextWidget(
                      text: AppStrings.splashTitle,
                      color: AppColors.kWhite,
                      fontSize: AppSizes.size22,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: AppSizes.bottomPadding50,
                child: GifView.asset(
                  AppImages.loading,
                  height: AppSizes.hSize150,
                  frameRate: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
