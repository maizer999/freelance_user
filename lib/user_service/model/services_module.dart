import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freelance_user/user_service/model/user_access_permission.dart';

import '../../helper/language/language_utils.dart';

class ServicesByModule {
  final String? headId;
  final String? header;
  final String? headerAr;
  final String? headerDescription;
  final String? headerIconPath;
  final String? headSequenceNo;
  List<UserAccessList>? services;

  ServicesByModule(
      {this.headId,
      this.header,
      this.headerAr,
      this.headerDescription,
      this.headerIconPath,
      this.headSequenceNo,
      this.services});

  String? getTitle(BuildContext context) {
    return isEnglish(context) ? header : (headerAr ?? header);
  }

  ServicesByModule clone() {
    return ServicesByModule(
        header: header,
        headerAr: headerAr,
        headId: headId,
        headerDescription: headerDescription,
        headerIconPath: headerIconPath,
        headSequenceNo: headSequenceNo,
        services: services);
  }
}
