
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
/*
*
* export class statusCode {
    public static Submitted = 1;
    public static Drafted = 2;
    public static Approved = 3;
    public static Rejected = 4;
    public static Cancelled = 5;
    public static Inactive = 6;
    public static ConditionalApproved = 7;
    public static Resubmitted = 8;
    public static ApprovedBySA = 9;
    public static RejectedBySA = 10;
    public static SharewithPort = 11;
    public static Open = 12;
    public static Reopen = 13;
    public static Assigned = 14;
    public static Resolved = 15;
    public static Closed = 16;
    public static ResponseCode = 200;
    public static StatusCode = 200;
    public static BadGateWay = 400;
    public static NotFound = 404;
    public static Unprocessable = 422;
    public static EclSubmitted = 12;
    public static EclDrafted = 13;
    public static EclApproved = 14;
    public static EclRejected = 15;
    public static PENDING=16;
    public static REGENERATE=17;
    public static PAID=18;
    public static UNPAID=19;
    public static MethodNotAllowed = 405;
    public static Created = 201;
    public static PmisDraft = 20;
    public static HttpLoop = 508;
}
* */
enum StatusEnum {
  submitted(1),
  draft(2),
  approved(3),
  reject(4),
  cancelled(5),
  inActive(6),
  approvedByPortContractor(7),
  rejectedByPortContractor(8),
  approvedBySA(9),
  rejectedBySA(10);

  const StatusEnum(this.id);

  final int id;

  Color getStatusColor() {
    switch (this) {
      case submitted:
        return AppColors.kFentSkyBlue;
      case draft:
        return AppColors.kOrangeColor;
      case approvedByPortContractor:
      case approved:
      case approvedBySA:
        return AppColors.kPrimaryGreenColor;
      case inActive:
        return AppColors.kOrangeColor;
      case rejectedByPortContractor:
      case reject:
      case rejectedBySA:
      case cancelled:
        return AppColors.kRed;
    }
  }

  String getStatusName() {
    var statusName = AppStrings.statusDraft;
    switch (this) {
      case submitted:
        statusName = AppStrings.statusSubmitted;
      case draft:
        statusName = AppStrings.statusDraft;
      case approvedByPortContractor:
        statusName = AppStrings.statusApprovedByPortContractor;
      case approved:
        statusName = AppStrings.statusApproved;
      case cancelled:
        statusName = AppStrings.statusCancelled;
      case inActive:
        statusName = AppStrings.statusInactive;
      case rejectedByPortContractor:
        statusName = AppStrings.statusRejectedByPortContractor;
      case reject:
        statusName = AppStrings.statusRejected;
      case rejectedBySA:
        statusName = AppStrings.statusRejectedByPortContractor;
      case approvedBySA:
        statusName = AppStrings.statusApprovedByPortContractor;
    }
    return statusName.tr();
  }

  StatusModel getStatusModel() {
    return StatusModel(statusId: id.toString(), statusName: name.tr());
  }

  static StatusEnum getByID(int id) {
    switch (id) {
      case 1:
        return StatusEnum.submitted;
      case 2:
        return StatusEnum.draft;
      case 3:
        return StatusEnum.approved;
      case 4:
        return StatusEnum.reject;
      case 5:
        return StatusEnum.cancelled;
      case 6:
        return StatusEnum.inActive;
      case 7:
        return StatusEnum.approvedByPortContractor;
      case 8:
        return StatusEnum.rejectedByPortContractor;
      case 9:
        return StatusEnum.approvedBySA;
      case 10:
        return StatusEnum.rejectedBySA;
      default:
        return StatusEnum.draft;
    }
  }
}

class StatusModel {
  final String statusId;
  final String statusName;
  final String? type; // Nullable field

  StatusModel({
    required this.statusId,
    required this.statusName,
    this.type,
  });

  @override
  bool operator ==(covariant StatusModel other) {
    if (identical(this, other)) return true;
    return other.statusId == statusId &&
        other.statusName == statusName;
  }

  @override
  int get hashCode => statusId.hashCode ^ statusName.hashCode ^ type.hashCode;

  @override
  String toString() =>
      'StatusModel(statusId: $statusId, statusName: $statusName, type: $type)';
}
