import 'package:dart_mappable/dart_mappable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as providerContainer;

import '../../constants/api_constants.dart';
import '../../helper/language/language_utils.dart';

part 'user_access_permission.mapper.dart';

enum UserType {
  signalTower("SIGTOW"),
  portOperator("PO"),
  unknown("");

  const UserType(this.code);

  final String code;

  static UserType getByCode(String code) {
    switch (code) {
      case "SIGTOW":
        return UserType.signalTower;
      case "PO":
        return UserType.portOperator;
      default:
        return UserType.unknown;
    }
  }
}



@MappableClass(ignoreNull: true)
class UserManagementUsersAccessResponse
    with UserManagementUsersAccessResponseMappable {
  final int? responseCode;
  final String? responseMessage;
  @MappableField(key: "data")
  final UserManagement? data;

  UserManagementUsersAccessResponse({
    this.responseCode,
    this.responseMessage,
    this.data,
  });
}

@MappableClass(ignoreNull: true)
class UserManagement with UserManagementMappable {
  @MappableField(key: "userData")
  final UserDetailsData? userData;
  final List<UserAccessList>? userAccess;

  UserManagement({
    this.userData,
    this.userAccess,
  });
}

@MappableClass(ignoreNull: true)
class UserAccessList with UserAccessListMappable {
  final String? headId;
  final String? header;
  final String? headerAr;
  final String? headerDescription;
  final String? headerIconPath;
  final String? headSequenceNo;
  final String? moduleId;
  final String? module;
  final String? moduleDescription;
  final String? moduleIconPath;
  final String? moduleRoute;
  final String? pageId;
  final String? mawaniMenuSetting;
  final String? page;
  final String? pageArabic;
  final String? pageCode;
  final String? pageDescription;
  final String? pageDescriptionArabic;
  final String? pageIconPath;
  final String? pageRoute;
  final String? pageSequence;
  final String? stakeholderCategoryRid;
  final String? stakeholderTypeId;
  final String? appId;
  final String? stakeHolderId;
  final String? accessPageId;
  final bool accessView;
  final bool accessCreate;
  final bool accessEdit;
  final bool accessDelete;
  final bool accessPrint;
  final bool accessApproveReject;
  final String? createdBy;
  final String? createdDate;
  final String? updatedBy;
  final String? updatedDate;
  final bool? isActive;
  bool? isMobileRequired;
  String? mobilePageRoute;
  final String? endpointUrl;

  UserAccessList({
    this.headId,
    this.header,
    this.headerAr,
    this.headerDescription,
    this.headerIconPath,
    this.headSequenceNo,
    this.moduleId,
    this.module,
    this.moduleDescription,
    this.moduleIconPath,
    this.moduleRoute,
    this.pageId,
    this.mawaniMenuSetting,
    this.page,
    this.pageArabic,
    this.pageCode,
    this.pageDescription,
    this.pageDescriptionArabic,
    this.pageIconPath,
    this.pageRoute,
    this.pageSequence,
    this.stakeholderCategoryRid,
    this.stakeholderTypeId,
    this.appId,
    this.stakeHolderId,
    this.accessPageId,
    this.accessView = false,
    this.accessCreate = false,
    this.accessEdit = false,
    this.accessDelete = false,
    this.accessPrint = false,
    this.accessApproveReject = false,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.isMobileRequired = false,
    this.mobilePageRoute,
    this.isActive,
    this.endpointUrl,
  });

  bool isServiceAvailable() {
    //&& phase1Routes.contains(mobilePageRoute ?? "")
    return (isMobileRequired ?? false);
  }

  String? getTitle(BuildContext context) {
    return isEnglish(context) ? page : pageArabic;
  }

  String getIcon() {
    final url = pageIconPath?.replaceAll("../../../..", "");
    return '${ApiEndPoints.baseImageURL}$url';
  }
}

@MappableClass(ignoreNull: true)
class UserDetailsData with UserDetailsDataMappable {
  final String? createdBy;
  final String? createdDate;
  final String? updatedBy;
  final String? updatedDate;
  final bool? isActive;
  final int? id;
  final int? appId;
  final String? employeeCode;
  final String? repNo;
  final String? repCode;
  final String? employeeName;
  final String? joiningDate;
  final int? departmentRid;
  final String? departmentCode;
  final String? departmentEn;
  final String? departmentAr;
  final int? designationRid;
  final String? designationCode;
  final String? designationEn;
  final String? designationAr;
  final int portRid;
  final String? portCode;
  final String? portNameEng;
  final String? portNameArb;
  final int? defaultGroupTypeRid;
  final String? defaultGroupTypeCode;
  final String? defaultGroupTypeEn;
  final String? defaultGroupTypeAr;
  final int? idTypeRid;
  final String? idTypeCode;
  final String? idTypeEn;
  final String? idTypeAr;
  final int? idNo;
  final String? idExpiryDate;
  final String? nationality;
  final String? nationalityCode;
  final String? nationalityEn;
  final String? nationalityAr;
  final String? dateOfBirth;
  final String? genderRid;
  final String? genderEn;
  final String? genderAr;
  final String? salutationAr;
  final String? salutationEn;
  final String? firstNameEn;
  final String? middleNameEn;
  final String? lastNameEn;
  final String? firstNameAr;
  final String? middleNameAr;
  final String? lastNameAr;
  final String? iamUserId;
  final String? userType;
  final String? userName;
  final String? profileImagePath;
  final String? emailId;
  final String? mobileNumber;
  final String? status;
  final bool? isLicenseRequired;
  final bool? isLicenseActive;
  final bool? isPermitActive;
  final List<StakeHolder>? stakeHolders;
  final List<String?>? userPorts;
  final UserOrganization? userOrganization;
  final UserBranch? userBranch;

  UserDetailsData({
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.isActive,
    this.id,
    this.appId,
    this.employeeCode,
    this.repNo,
    this.repCode,
    this.employeeName,
    this.joiningDate,
    this.departmentRid,
    this.departmentCode,
    this.departmentEn,
    this.departmentAr,
    this.designationRid,
    this.designationCode,
    this.designationEn,
    this.designationAr,
    required this.portRid,
    this.portCode,
    this.portNameEng,
    this.portNameArb,
    this.defaultGroupTypeRid,
    this.defaultGroupTypeCode,
    this.defaultGroupTypeEn,
    this.defaultGroupTypeAr,
    this.idTypeRid,
    this.idTypeCode,
    this.idTypeEn,
    this.idTypeAr,
    this.idNo,
    this.idExpiryDate,
    this.nationality,
    this.nationalityCode,
    this.nationalityEn,
    this.nationalityAr,
    this.dateOfBirth,
    this.genderRid,
    this.genderEn,
    this.genderAr,
    this.salutationAr,
    this.salutationEn,
    this.firstNameEn,
    this.middleNameEn,
    this.lastNameEn,
    this.firstNameAr,
    this.middleNameAr,
    this.lastNameAr,
    this.iamUserId,
    this.userType,
    this.userName,
    this.profileImagePath,
    this.emailId,
    this.mobileNumber,
    this.status,
    this.isLicenseRequired,
    this.isLicenseActive,
    this.isPermitActive,
    this.stakeHolders,
    this.userPorts,
    this.userOrganization,
    this.userBranch,
  });

  String? getPortName(BuildContext context) {
    return isEnglish(context) ? portNameEng : portNameArb;
  }
}

@MappableClass(ignoreNull: true)
class StakeHolder with StakeHolderMappable {
  final String? roleId;
  final String? stakeholderCode;
  final String? stakeholderNameEng;
  final String? stakeholderNameArabic;
  final int? stakeholderTypeId;
  final String? subRoleId;
  final String? stakeholderSubRoleId;
  final String? stakeholderSubRoleCode;
  final String? stakeholderTypeSubRoleNameEng;
  final String? stakeholderTypeSubRoleNameArabic;
  final bool? isLicenseRequired;

  StakeHolder({
    this.roleId,
    this.stakeholderCode,
    this.stakeholderNameEng,
    this.stakeholderNameArabic,
    this.stakeholderTypeId,
    this.subRoleId,
    this.stakeholderSubRoleId,
    this.stakeholderSubRoleCode,
    this.stakeholderTypeSubRoleNameEng,
    this.stakeholderTypeSubRoleNameArabic,
    this.isLicenseRequired,
  });
}

@MappableClass(ignoreNull: true)
class UserBranch with UserBranchMappable {
  final int? id;
  final String? branchId;
  final int? orgId;
  final String? branchName;
  final String? locationRid;
  final int? portRid;
  final String? createdBy;
  final String? createdDate;
  final String? updatedBy;
  final String? updatedDate;
  final bool? isActive;
  final String? portNameEnglish;
  final String? portNameArabic;
  final String? locationNameEnglish;
  final String? locationNameArabic;

  UserBranch({
    this.id,
    this.branchId,
    this.orgId,
    this.branchName,
    this.locationRid,
    this.portRid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.isActive,
    this.portNameEnglish,
    this.portNameArabic,
    this.locationNameEnglish,
    this.locationNameArabic,
  });
}

@MappableClass(ignoreNull: true)
class UserOrganization with UserOrganizationMappable {
  final String? createdBy;
  final String? createdDate;
  final String? updatedBy;
  final String? updatedDate;
  final bool? isActive;
  final String? registrationThroughCode;
  final String? registrationThroughEn;
  final String? registrationThroughAr;
  final String? registrationTypeCode;
  final String? registrationTypeEn;
  final String? registrationTypeAr;
  final String? orgIdTypeCode;
  final String? orgIdTypeEn;
  final String? orgIdTypeAr;
  final int? id;
  final int? crn;
  final String? orgId;
  final String? orgNameEn;
  final String? orgNameAr;
  final int? registrationThroughRid;
  final int? registrationTypeRid;
  final String? documentNumber;
  final String? unitNo;
  final int? zipCode;
  final String? buildingNo;
  final String? street;
  final String? address;
  final String? fileName;
  final String? filePath;
  final int? approvalStatusRid;
  final String? orgEmail;
  final String? district;
  final String? documentStatus;
  final String? stakeholderTypeRid;
  final String? stakeholderTypeNameEng;
  final String? stakeholderTypeNameArabic;
  final int? cityRid;
  final String? userName;
  final String? orgIdType;
  final String? orgIdNo;
  final String? orgIdExpiryDate;
  final String? orgNationality;
  final int? orgMobile;
  final String? licenseNo;
  final String? licenseExpiryDate;
  final bool? isRegistrationApproved;
  final bool? isLicenseUser;
  final List<UserLicense>? userLicense;

  UserOrganization({
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.isActive,
    this.registrationThroughCode,
    this.registrationThroughEn,
    this.registrationThroughAr,
    this.registrationTypeCode,
    this.registrationTypeEn,
    this.registrationTypeAr,
    this.orgIdTypeCode,
    this.orgIdTypeEn,
    this.orgIdTypeAr,
    this.id,
    this.crn,
    this.orgId,
    this.orgNameEn,
    this.orgNameAr,
    this.registrationThroughRid,
    this.registrationTypeRid,
    this.documentNumber,
    this.unitNo,
    this.zipCode,
    this.buildingNo,
    this.street,
    this.address,
    this.fileName,
    this.filePath,
    this.approvalStatusRid,
    this.orgEmail,
    this.district,
    this.documentStatus,
    this.stakeholderTypeRid,
    this.stakeholderTypeNameEng,
    this.stakeholderTypeNameArabic,
    this.cityRid,
    this.userName,
    this.orgIdType,
    this.orgIdNo,
    this.orgIdExpiryDate,
    this.orgNationality,
    this.orgMobile,
    this.licenseNo,
    this.licenseExpiryDate,
    this.isRegistrationApproved,
    this.isLicenseUser,
    this.userLicense,
  });
}

@MappableClass(ignoreNull: true)
class UserLicense with UserLicenseMappable {
  final int? id;
  final int? userOrgId;
  final String? orgId;
  final String? orgName;
  final String? stakeholderTypeRid;
  final int? crn;
  final String? licenseTypeRid;
  final String? investorTypeRid;
  final int? eunn;
  final String? establishmentName;
  final String? establishmentType;
  final String? establishmentActivity;
  final String? establishmentStatus;
  final String? establishmentIssueDate;
  final String? establishmentExpiryDate;
  final String? establishmentCity;
  final String? recordType;
  final String? address;
  final String? mailbox;
  final String? managerName;
  final String? managerNationality;
  final String? listOfPartners;
  final String? sadadNo;
  final String? licenseNumber;
  final String? licenseExpiryDate;
  final int? licenseStatusRid;
  final int? requestTypeRid;
  final int? approvalStatusRid;
  final String? fileName;
  final String? filePath;
  final String? suspensionTo;
  final int? idNumber;

  UserLicense({
    this.id,
    this.userOrgId,
    this.orgId,
    this.orgName,
    this.stakeholderTypeRid,
    this.crn,
    this.licenseTypeRid,
    this.investorTypeRid,
    this.eunn,
    this.establishmentName,
    this.establishmentType,
    this.establishmentActivity,
    this.establishmentStatus,
    this.establishmentIssueDate,
    this.establishmentExpiryDate,
    this.establishmentCity,
    this.recordType,
    this.address,
    this.mailbox,
    this.managerName,
    this.managerNationality,
    this.listOfPartners,
    this.sadadNo,
    this.licenseNumber,
    this.licenseExpiryDate,
    this.licenseStatusRid,
    this.requestTypeRid,
    this.approvalStatusRid,
    this.fileName,
    this.filePath,
    this.suspensionTo,
    this.idNumber,
  });
}
