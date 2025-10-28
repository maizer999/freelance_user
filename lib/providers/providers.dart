import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_strings.dart';
import '../enum/status_model.dart';
import '../helper/system_preferences_helper.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => "");
final isSearchEnabled = StateProvider.autoDispose<bool>((ref) => false);
final searchQueryCountProvider = StateProvider.autoDispose<int>((ref) => 0);

final selectedStatusFilterChipProvider = StateProvider.autoDispose<StatusModel>(
  (ref) {
    return StatusModel(statusId: '', statusName: AppStrings.statusAll);
  },
  name: "selectedStatusFilterChipProvider",
);
final lastSubmittedStatusProvider = StateProvider<String?>((ref) => "");
//common status filter provider
final commonStatusIdsProvider =
    Provider.autoDispose.family<List<int>, List<StatusModel>>(
  (ref, availableStatuses) {
    final selectedFilter = ref.watch(
      selectedStatusFilterChipProvider.select(
        (value) => value.statusName,
      ),
    );

    if (selectedFilter == AppStrings.statusAll) {
      return availableStatuses
          .map((e) => int.tryParse(e.statusId))
          .where((id) => id != null)
          .map((id) => id!)
          .toList();
    } else {
      return availableStatuses
          .where((status) => selectedFilter == status.statusName)
          .map((e) => int.tryParse(e.statusId))
          .where((id) => id != null)
          .map((id) => id!)
          .toList();
    }
  },
  name: "commonStatusIdsProvider ",
);

final localizationDataProvider =
    FutureProvider<Map<String, dynamic>>((ref) async {
  final data = await SystemPreferencesHelper.getLocalizationData();
  return data ?? {};
});
