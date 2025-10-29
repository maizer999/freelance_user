import 'package:freelance_user/providers/rollbase_string_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../user_service/model/user_access_permission.dart';

final globalPermissionProvider = StateProvider<List<UserAccessList>>(
  (ref) {
    return [];
  },
  name: "globalPermissionProvider",
);

final userRoleProvider = StateProvider<UserType>(
      (ref) {
    return UserType.unknown;
  },
  name: "userRoleProvider",
);
typedef AccessParams = ({String pageUrl, String permissionType});

final accessControlProvider = NotifierProvider.autoDispose
    .family<AccessControlNotifier, bool, AccessParams>(
  AccessControlNotifier.new,
  name: "accessControlProvider",
);

class AccessControlNotifier
    extends AutoDisposeFamilyNotifier<bool, AccessParams> {
  @override
  bool build(AccessParams arg) {
    return checkButtonAccess(
      pageUrl: arg.pageUrl,
      permissionType: arg.permissionType,
    );
  }

  bool checkButtonAccess({
    required String pageUrl,
    required String permissionType,
  }) {
    final globalPermissionList = ref.watch(globalPermissionProvider);
    if (pageUrl.isEmpty) {
      return true;
    }
    bool doesHaveAccess = false;
    String url = pageUrl;
    if (url.isNotEmpty && !url.startsWith("/")) {
      url = "/$url";
    }

    for (var element in globalPermissionList) {
      if (element.mobilePageRoute?.toLowerCase() == url.toLowerCase()) {
        switch (permissionType) {
          case RollBaseStringConstant.createAccess:
            doesHaveAccess = element.accessCreate;
            break;
          case RollBaseStringConstant.editAccess:
            doesHaveAccess = element.accessEdit;
            break;
          case RollBaseStringConstant.deleteAccess:
            doesHaveAccess = element.accessDelete;
            break;
          case RollBaseStringConstant.viewAccess:
            doesHaveAccess = element.accessView;
            break;
          case RollBaseStringConstant.printAccess:
            doesHaveAccess = element.accessPrint;
            break;
          case RollBaseStringConstant.approveRejectAccess:
            doesHaveAccess = element.accessApproveReject;
            break;
          default:
            doesHaveAccess = true;
        }
        break;
      }
    }
    return doesHaveAccess;
  }
}
