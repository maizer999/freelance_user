import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../routes/auto_route_observer.dart';

class LanguageListener extends StatefulWidget {
  final Widget child;
  const LanguageListener({super.key, required this.child});

  @override
  State<LanguageListener> createState() => _LanguageListenerState();
}

class _LanguageListenerState extends State<LanguageListener>
    with WidgetsBindingObserver {
  Locale deviceLocale = PlatformDispatcher.instance.locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    final oldLocale = deviceLocale;
    if (locales != null && locales.isNotEmpty) {
      deviceLocale = locales.first;
    }
    talker.debug("Device language changed from $oldLocale to $deviceLocale");
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        context.setLocale(Locale(deviceLocale.languageCode));
      },
    );
    super.didChangeLocales(locales);
  }

  @override
  Widget build(BuildContext context) {
    talker.debug(deviceLocale);
    return widget.child;
  }
}