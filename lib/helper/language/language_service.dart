import 'package:freelance_user/helper/retry_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/api_constants.dart';
import '../../network/network_handler.dart';

final languageTranslationProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>(
  (ref) async {
    final retryFunction = ref.withRetryFunction(
      maxRetries: 3,
      delay: const Duration(milliseconds: 200),
      backoffFactor: 2.0,
    );
    return await retryFunction(
      () async {
        // final List<String> modules = [
        //   "ALTCNF",
        //   "CCM",
        //   "DMRG",
        //   "GENERAL",
        //   "RPA",
        //   "T_P",
        //   "USRMGMT",
        //   "VCOM",
        //   "VVM",
        //   "V_I",
        //   "MENU",
        //   "ExceptionMessages",
        //   "TP"
        // ];
        final List<String> modules = [
          "ALTCNF",
          "CCM",
          "DMR",
          "DMRG",
          "DRPT",
          "ExceptionMessages",
          "GENERAL",
          "LKP",
          "MENU",
          "RPA",
          "TP",
          "T_P",
          "USRMGMT",
          "VCOM",
          "VVM",
          "V_I",
        ];

        final Map<String, dynamic> queryParams = {
          "module": modules.join(","),
        };

        final response = await NetworkHandler.getRequest(
          endpoint: ApiEndPoints.localizationByMap,
          params: queryParams,
          headers: await NetworkHandler.getCommonHeadersWithoutToken(),
        );
        if (response is Map<String, dynamic> && response.containsKey("data")) {
          ref.keepAlive();
          return response["data"];
        } else {
          throw Exception("Failed to load language data");
        }
      },
    );
  },
  name: 'languageTranslationProvider',
);
