import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelance_user/helper/language/translation_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/app_strings.dart';
import '../../routes/auto_route_observer.dart';
import '../../routes/auto_router_provider.dart';
import '../../routes/router.gr.dart';
import 'language_service.dart';

class CustomEasyLocalization extends ConsumerStatefulWidget {
  final Widget child;

  const CustomEasyLocalization({super.key, required this.child});

  @override
  ConsumerState<CustomEasyLocalization> createState() =>
      _CustomEasyLocalizationState();
}

class _CustomEasyLocalizationState
    extends ConsumerState<CustomEasyLocalization> {
  /// A watcher for language translation provider
  /// which will help in rebuilding the easy localization when translation cannot be loaded from server
  /// but later will render the whole ui after got translation data from server
  ///
  /// Here if provider have state [AsyncError] means the provider have error loading the translation
  /// but if later when it comes data rebuild the whole app using invalidating [languageTranslationProvider]
  ///
  void listenToTranslation(
    AsyncValue<Map<String, dynamic>>? previous,
    AsyncValue<Map<String, dynamic>> next,
  ) async {
    if (next is AsyncError) {
      await Future.delayed(
        const Duration(seconds: 2),
        () {
          ref.read(autoRouterProvider).push(
                CommonResponseDialogRoute(
                  responseMessage: AppStrings.languageTrans,
                ),
              );
        },
      );
    } else if (previous is AsyncError && next is AsyncData) {
      talker.debug("translation loaded from server after error occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      languageTranslationProvider,
      listenToTranslation,
    );
    final languageAsync = ref.watch(languageTranslationProvider);
    if (languageAsync.hasValue) {
      return EasyLocalization(
        key: const ValueKey("Easy Loaded Data"),
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          ),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        assetLoader:
            ApiTranslationLoader(languages: languageAsync.requireValue),
        child: widget.child,
      );
    }

    return EasyLocalization(
      supportedLocales: const [
        Locale(
          'en',
        ),
        Locale(
          'ar',
        ),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: widget.child,
    );
  }
}

///
