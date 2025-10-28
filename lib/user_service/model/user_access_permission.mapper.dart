// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_access_permission.dart';

class UserManagementUsersAccessResponseMapper
    extends ClassMapperBase<UserManagementUsersAccessResponse> {
  UserManagementUsersAccessResponseMapper._();

  static UserManagementUsersAccessResponseMapper? _instance;
  static UserManagementUsersAccessResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = UserManagementUsersAccessResponseMapper._(),
      );
      UserManagementMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserManagementUsersAccessResponse';

  static int? _$responseCode(UserManagementUsersAccessResponse v) =>
      v.responseCode;
  static const Field<UserManagementUsersAccessResponse, int> _f$responseCode =
      Field('responseCode', _$responseCode, opt: true);
  static String? _$responseMessage(UserManagementUsersAccessResponse v) =>
      v.responseMessage;
  static const Field<UserManagementUsersAccessResponse, String>
  _f$responseMessage = Field('responseMessage', _$responseMessage, opt: true);
  static UserManagement? _$data(UserManagementUsersAccessResponse v) => v.data;
  static const Field<UserManagementUsersAccessResponse, UserManagement>
  _f$data = Field('data', _$data, opt: true);

  @override
  final MappableFields<UserManagementUsersAccessResponse> fields = const {
    #responseCode: _f$responseCode,
    #responseMessage: _f$responseMessage,
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  static UserManagementUsersAccessResponse _instantiate(DecodingData data) {
    return UserManagementUsersAccessResponse(
      responseCode: data.dec(_f$responseCode),
      responseMessage: data.dec(_f$responseMessage),
      data: data.dec(_f$data),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserManagementUsersAccessResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserManagementUsersAccessResponse>(
      map,
    );
  }

  static UserManagementUsersAccessResponse fromJson(String json) {
    return ensureInitialized().decodeJson<UserManagementUsersAccessResponse>(
      json,
    );
  }
}

mixin UserManagementUsersAccessResponseMappable {
  String toJson() {
    return UserManagementUsersAccessResponseMapper.ensureInitialized()
        .encodeJson<UserManagementUsersAccessResponse>(
          this as UserManagementUsersAccessResponse,
        );
  }

  Map<String, dynamic> toMap() {
    return UserManagementUsersAccessResponseMapper.ensureInitialized()
        .encodeMap<UserManagementUsersAccessResponse>(
          this as UserManagementUsersAccessResponse,
        );
  }

  UserManagementUsersAccessResponseCopyWith<
    UserManagementUsersAccessResponse,
    UserManagementUsersAccessResponse,
    UserManagementUsersAccessResponse
  >
  get copyWith =>
      _UserManagementUsersAccessResponseCopyWithImpl<
        UserManagementUsersAccessResponse,
        UserManagementUsersAccessResponse
      >(this as UserManagementUsersAccessResponse, $identity, $identity);
  @override
  String toString() {
    return UserManagementUsersAccessResponseMapper.ensureInitialized()
        .stringifyValue(this as UserManagementUsersAccessResponse);
  }

  @override
  bool operator ==(Object other) {
    return UserManagementUsersAccessResponseMapper.ensureInitialized()
        .equalsValue(this as UserManagementUsersAccessResponse, other);
  }

  @override
  int get hashCode {
    return UserManagementUsersAccessResponseMapper.ensureInitialized()
        .hashValue(this as UserManagementUsersAccessResponse);
  }
}

extension UserManagementUsersAccessResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserManagementUsersAccessResponse, $Out> {
  UserManagementUsersAccessResponseCopyWith<
    $R,
    UserManagementUsersAccessResponse,
    $Out
  >
  get $asUserManagementUsersAccessResponse => $base.as(
    (v, t, t2) =>
        _UserManagementUsersAccessResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class UserManagementUsersAccessResponseCopyWith<
  $R,
  $In extends UserManagementUsersAccessResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  UserManagementCopyWith<$R, UserManagement, UserManagement>? get data;
  $R call({int? responseCode, String? responseMessage, UserManagement? data});
  UserManagementUsersAccessResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserManagementUsersAccessResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserManagementUsersAccessResponse, $Out>
    implements
        UserManagementUsersAccessResponseCopyWith<
          $R,
          UserManagementUsersAccessResponse,
          $Out
        > {
  _UserManagementUsersAccessResponseCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<UserManagementUsersAccessResponse> $mapper =
      UserManagementUsersAccessResponseMapper.ensureInitialized();
  @override
  UserManagementCopyWith<$R, UserManagement, UserManagement>? get data =>
      $value.data?.copyWith.$chain((v) => call(data: v));
  @override
  $R call({
    Object? responseCode = $none,
    Object? responseMessage = $none,
    Object? data = $none,
  }) => $apply(
    FieldCopyWithData({
      if (responseCode != $none) #responseCode: responseCode,
      if (responseMessage != $none) #responseMessage: responseMessage,
      if (data != $none) #data: data,
    }),
  );
  @override
  UserManagementUsersAccessResponse $make(CopyWithData data) =>
      UserManagementUsersAccessResponse(
        responseCode: data.get(#responseCode, or: $value.responseCode),
        responseMessage: data.get(#responseMessage, or: $value.responseMessage),
        data: data.get(#data, or: $value.data),
      );

  @override
  UserManagementUsersAccessResponseCopyWith<
    $R2,
    UserManagementUsersAccessResponse,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _UserManagementUsersAccessResponseCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class UserManagementMapper extends ClassMapperBase<UserManagement> {
  UserManagementMapper._();

  static UserManagementMapper? _instance;
  static UserManagementMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserManagementMapper._());
      UserDetailsDataMapper.ensureInitialized();
      UserAccessListMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserManagement';

  static UserDetailsData? _$userData(UserManagement v) => v.userData;
  static const Field<UserManagement, UserDetailsData> _f$userData = Field(
    'userData',
    _$userData,
    opt: true,
  );
  static List<UserAccessList>? _$userAccess(UserManagement v) => v.userAccess;
  static const Field<UserManagement, List<UserAccessList>> _f$userAccess =
      Field('userAccess', _$userAccess, opt: true);

  @override
  final MappableFields<UserManagement> fields = const {
    #userData: _f$userData,
    #userAccess: _f$userAccess,
  };
  @override
  final bool ignoreNull = true;

  static UserManagement _instantiate(DecodingData data) {
    return UserManagement(
      userData: data.dec(_f$userData),
      userAccess: data.dec(_f$userAccess),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserManagement fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserManagement>(map);
  }

  static UserManagement fromJson(String json) {
    return ensureInitialized().decodeJson<UserManagement>(json);
  }
}

mixin UserManagementMappable {
  String toJson() {
    return UserManagementMapper.ensureInitialized().encodeJson<UserManagement>(
      this as UserManagement,
    );
  }

  Map<String, dynamic> toMap() {
    return UserManagementMapper.ensureInitialized().encodeMap<UserManagement>(
      this as UserManagement,
    );
  }

  UserManagementCopyWith<UserManagement, UserManagement, UserManagement>
  get copyWith => _UserManagementCopyWithImpl<UserManagement, UserManagement>(
    this as UserManagement,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return UserManagementMapper.ensureInitialized().stringifyValue(
      this as UserManagement,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserManagementMapper.ensureInitialized().equalsValue(
      this as UserManagement,
      other,
    );
  }

  @override
  int get hashCode {
    return UserManagementMapper.ensureInitialized().hashValue(
      this as UserManagement,
    );
  }
}

extension UserManagementValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserManagement, $Out> {
  UserManagementCopyWith<$R, UserManagement, $Out> get $asUserManagement =>
      $base.as((v, t, t2) => _UserManagementCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserManagementCopyWith<$R, $In extends UserManagement, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserDetailsDataCopyWith<$R, UserDetailsData, UserDetailsData>? get userData;
  ListCopyWith<
    $R,
    UserAccessList,
    UserAccessListCopyWith<$R, UserAccessList, UserAccessList>
  >?
  get userAccess;
  $R call({UserDetailsData? userData, List<UserAccessList>? userAccess});
  UserManagementCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserManagementCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserManagement, $Out>
    implements UserManagementCopyWith<$R, UserManagement, $Out> {
  _UserManagementCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserManagement> $mapper =
      UserManagementMapper.ensureInitialized();
  @override
  UserDetailsDataCopyWith<$R, UserDetailsData, UserDetailsData>? get userData =>
      $value.userData?.copyWith.$chain((v) => call(userData: v));
  @override
  ListCopyWith<
    $R,
    UserAccessList,
    UserAccessListCopyWith<$R, UserAccessList, UserAccessList>
  >?
  get userAccess => $value.userAccess != null
      ? ListCopyWith(
          $value.userAccess!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(userAccess: v),
        )
      : null;
  @override
  $R call({Object? userData = $none, Object? userAccess = $none}) => $apply(
    FieldCopyWithData({
      if (userData != $none) #userData: userData,
      if (userAccess != $none) #userAccess: userAccess,
    }),
  );
  @override
  UserManagement $make(CopyWithData data) => UserManagement(
    userData: data.get(#userData, or: $value.userData),
    userAccess: data.get(#userAccess, or: $value.userAccess),
  );

  @override
  UserManagementCopyWith<$R2, UserManagement, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserManagementCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserDetailsDataMapper extends ClassMapperBase<UserDetailsData> {
  UserDetailsDataMapper._();

  static UserDetailsDataMapper? _instance;
  static UserDetailsDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserDetailsDataMapper._());
      StakeHolderMapper.ensureInitialized();
      UserOrganizationMapper.ensureInitialized();
      UserBranchMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserDetailsData';

  static String? _$createdBy(UserDetailsData v) => v.createdBy;
  static const Field<UserDetailsData, String> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    opt: true,
  );
  static String? _$createdDate(UserDetailsData v) => v.createdDate;
  static const Field<UserDetailsData, String> _f$createdDate = Field(
    'createdDate',
    _$createdDate,
    opt: true,
  );
  static String? _$updatedBy(UserDetailsData v) => v.updatedBy;
  static const Field<UserDetailsData, String> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    opt: true,
  );
  static String? _$updatedDate(UserDetailsData v) => v.updatedDate;
  static const Field<UserDetailsData, String> _f$updatedDate = Field(
    'updatedDate',
    _$updatedDate,
    opt: true,
  );
  static bool? _$isActive(UserDetailsData v) => v.isActive;
  static const Field<UserDetailsData, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
  );
  static int? _$id(UserDetailsData v) => v.id;
  static const Field<UserDetailsData, int> _f$id = Field('id', _$id, opt: true);
  static int? _$appId(UserDetailsData v) => v.appId;
  static const Field<UserDetailsData, int> _f$appId = Field(
    'appId',
    _$appId,
    opt: true,
  );
  static String? _$employeeCode(UserDetailsData v) => v.employeeCode;
  static const Field<UserDetailsData, String> _f$employeeCode = Field(
    'employeeCode',
    _$employeeCode,
    opt: true,
  );
  static String? _$repNo(UserDetailsData v) => v.repNo;
  static const Field<UserDetailsData, String> _f$repNo = Field(
    'repNo',
    _$repNo,
    opt: true,
  );
  static String? _$repCode(UserDetailsData v) => v.repCode;
  static const Field<UserDetailsData, String> _f$repCode = Field(
    'repCode',
    _$repCode,
    opt: true,
  );
  static String? _$employeeName(UserDetailsData v) => v.employeeName;
  static const Field<UserDetailsData, String> _f$employeeName = Field(
    'employeeName',
    _$employeeName,
    opt: true,
  );
  static String? _$joiningDate(UserDetailsData v) => v.joiningDate;
  static const Field<UserDetailsData, String> _f$joiningDate = Field(
    'joiningDate',
    _$joiningDate,
    opt: true,
  );
  static int? _$departmentRid(UserDetailsData v) => v.departmentRid;
  static const Field<UserDetailsData, int> _f$departmentRid = Field(
    'departmentRid',
    _$departmentRid,
    opt: true,
  );
  static String? _$departmentCode(UserDetailsData v) => v.departmentCode;
  static const Field<UserDetailsData, String> _f$departmentCode = Field(
    'departmentCode',
    _$departmentCode,
    opt: true,
  );
  static String? _$departmentEn(UserDetailsData v) => v.departmentEn;
  static const Field<UserDetailsData, String> _f$departmentEn = Field(
    'departmentEn',
    _$departmentEn,
    opt: true,
  );
  static String? _$departmentAr(UserDetailsData v) => v.departmentAr;
  static const Field<UserDetailsData, String> _f$departmentAr = Field(
    'departmentAr',
    _$departmentAr,
    opt: true,
  );
  static int? _$designationRid(UserDetailsData v) => v.designationRid;
  static const Field<UserDetailsData, int> _f$designationRid = Field(
    'designationRid',
    _$designationRid,
    opt: true,
  );
  static String? _$designationCode(UserDetailsData v) => v.designationCode;
  static const Field<UserDetailsData, String> _f$designationCode = Field(
    'designationCode',
    _$designationCode,
    opt: true,
  );
  static String? _$designationEn(UserDetailsData v) => v.designationEn;
  static const Field<UserDetailsData, String> _f$designationEn = Field(
    'designationEn',
    _$designationEn,
    opt: true,
  );
  static String? _$designationAr(UserDetailsData v) => v.designationAr;
  static const Field<UserDetailsData, String> _f$designationAr = Field(
    'designationAr',
    _$designationAr,
    opt: true,
  );
  static int _$portRid(UserDetailsData v) => v.portRid;
  static const Field<UserDetailsData, int> _f$portRid = Field(
    'portRid',
    _$portRid,
  );
  static String? _$portCode(UserDetailsData v) => v.portCode;
  static const Field<UserDetailsData, String> _f$portCode = Field(
    'portCode',
    _$portCode,
    opt: true,
  );
  static String? _$portNameEng(UserDetailsData v) => v.portNameEng;
  static const Field<UserDetailsData, String> _f$portNameEng = Field(
    'portNameEng',
    _$portNameEng,
    opt: true,
  );
  static String? _$portNameArb(UserDetailsData v) => v.portNameArb;
  static const Field<UserDetailsData, String> _f$portNameArb = Field(
    'portNameArb',
    _$portNameArb,
    opt: true,
  );
  static int? _$defaultGroupTypeRid(UserDetailsData v) => v.defaultGroupTypeRid;
  static const Field<UserDetailsData, int> _f$defaultGroupTypeRid = Field(
    'defaultGroupTypeRid',
    _$defaultGroupTypeRid,
    opt: true,
  );
  static String? _$defaultGroupTypeCode(UserDetailsData v) =>
      v.defaultGroupTypeCode;
  static const Field<UserDetailsData, String> _f$defaultGroupTypeCode = Field(
    'defaultGroupTypeCode',
    _$defaultGroupTypeCode,
    opt: true,
  );
  static String? _$defaultGroupTypeEn(UserDetailsData v) =>
      v.defaultGroupTypeEn;
  static const Field<UserDetailsData, String> _f$defaultGroupTypeEn = Field(
    'defaultGroupTypeEn',
    _$defaultGroupTypeEn,
    opt: true,
  );
  static String? _$defaultGroupTypeAr(UserDetailsData v) =>
      v.defaultGroupTypeAr;
  static const Field<UserDetailsData, String> _f$defaultGroupTypeAr = Field(
    'defaultGroupTypeAr',
    _$defaultGroupTypeAr,
    opt: true,
  );
  static int? _$idTypeRid(UserDetailsData v) => v.idTypeRid;
  static const Field<UserDetailsData, int> _f$idTypeRid = Field(
    'idTypeRid',
    _$idTypeRid,
    opt: true,
  );
  static String? _$idTypeCode(UserDetailsData v) => v.idTypeCode;
  static const Field<UserDetailsData, String> _f$idTypeCode = Field(
    'idTypeCode',
    _$idTypeCode,
    opt: true,
  );
  static String? _$idTypeEn(UserDetailsData v) => v.idTypeEn;
  static const Field<UserDetailsData, String> _f$idTypeEn = Field(
    'idTypeEn',
    _$idTypeEn,
    opt: true,
  );
  static String? _$idTypeAr(UserDetailsData v) => v.idTypeAr;
  static const Field<UserDetailsData, String> _f$idTypeAr = Field(
    'idTypeAr',
    _$idTypeAr,
    opt: true,
  );
  static int? _$idNo(UserDetailsData v) => v.idNo;
  static const Field<UserDetailsData, int> _f$idNo = Field(
    'idNo',
    _$idNo,
    opt: true,
  );
  static String? _$idExpiryDate(UserDetailsData v) => v.idExpiryDate;
  static const Field<UserDetailsData, String> _f$idExpiryDate = Field(
    'idExpiryDate',
    _$idExpiryDate,
    opt: true,
  );
  static String? _$nationality(UserDetailsData v) => v.nationality;
  static const Field<UserDetailsData, String> _f$nationality = Field(
    'nationality',
    _$nationality,
    opt: true,
  );
  static String? _$nationalityCode(UserDetailsData v) => v.nationalityCode;
  static const Field<UserDetailsData, String> _f$nationalityCode = Field(
    'nationalityCode',
    _$nationalityCode,
    opt: true,
  );
  static String? _$nationalityEn(UserDetailsData v) => v.nationalityEn;
  static const Field<UserDetailsData, String> _f$nationalityEn = Field(
    'nationalityEn',
    _$nationalityEn,
    opt: true,
  );
  static String? _$nationalityAr(UserDetailsData v) => v.nationalityAr;
  static const Field<UserDetailsData, String> _f$nationalityAr = Field(
    'nationalityAr',
    _$nationalityAr,
    opt: true,
  );
  static String? _$dateOfBirth(UserDetailsData v) => v.dateOfBirth;
  static const Field<UserDetailsData, String> _f$dateOfBirth = Field(
    'dateOfBirth',
    _$dateOfBirth,
    opt: true,
  );
  static String? _$genderRid(UserDetailsData v) => v.genderRid;
  static const Field<UserDetailsData, String> _f$genderRid = Field(
    'genderRid',
    _$genderRid,
    opt: true,
  );
  static String? _$genderEn(UserDetailsData v) => v.genderEn;
  static const Field<UserDetailsData, String> _f$genderEn = Field(
    'genderEn',
    _$genderEn,
    opt: true,
  );
  static String? _$genderAr(UserDetailsData v) => v.genderAr;
  static const Field<UserDetailsData, String> _f$genderAr = Field(
    'genderAr',
    _$genderAr,
    opt: true,
  );
  static String? _$salutationAr(UserDetailsData v) => v.salutationAr;
  static const Field<UserDetailsData, String> _f$salutationAr = Field(
    'salutationAr',
    _$salutationAr,
    opt: true,
  );
  static String? _$salutationEn(UserDetailsData v) => v.salutationEn;
  static const Field<UserDetailsData, String> _f$salutationEn = Field(
    'salutationEn',
    _$salutationEn,
    opt: true,
  );
  static String? _$firstNameEn(UserDetailsData v) => v.firstNameEn;
  static const Field<UserDetailsData, String> _f$firstNameEn = Field(
    'firstNameEn',
    _$firstNameEn,
    opt: true,
  );
  static String? _$middleNameEn(UserDetailsData v) => v.middleNameEn;
  static const Field<UserDetailsData, String> _f$middleNameEn = Field(
    'middleNameEn',
    _$middleNameEn,
    opt: true,
  );
  static String? _$lastNameEn(UserDetailsData v) => v.lastNameEn;
  static const Field<UserDetailsData, String> _f$lastNameEn = Field(
    'lastNameEn',
    _$lastNameEn,
    opt: true,
  );
  static String? _$firstNameAr(UserDetailsData v) => v.firstNameAr;
  static const Field<UserDetailsData, String> _f$firstNameAr = Field(
    'firstNameAr',
    _$firstNameAr,
    opt: true,
  );
  static String? _$middleNameAr(UserDetailsData v) => v.middleNameAr;
  static const Field<UserDetailsData, String> _f$middleNameAr = Field(
    'middleNameAr',
    _$middleNameAr,
    opt: true,
  );
  static String? _$lastNameAr(UserDetailsData v) => v.lastNameAr;
  static const Field<UserDetailsData, String> _f$lastNameAr = Field(
    'lastNameAr',
    _$lastNameAr,
    opt: true,
  );
  static String? _$iamUserId(UserDetailsData v) => v.iamUserId;
  static const Field<UserDetailsData, String> _f$iamUserId = Field(
    'iamUserId',
    _$iamUserId,
    opt: true,
  );
  static String? _$userType(UserDetailsData v) => v.userType;
  static const Field<UserDetailsData, String> _f$userType = Field(
    'userType',
    _$userType,
    opt: true,
  );
  static String? _$userName(UserDetailsData v) => v.userName;
  static const Field<UserDetailsData, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
  );
  static String? _$profileImagePath(UserDetailsData v) => v.profileImagePath;
  static const Field<UserDetailsData, String> _f$profileImagePath = Field(
    'profileImagePath',
    _$profileImagePath,
    opt: true,
  );
  static String? _$emailId(UserDetailsData v) => v.emailId;
  static const Field<UserDetailsData, String> _f$emailId = Field(
    'emailId',
    _$emailId,
    opt: true,
  );
  static String? _$mobileNumber(UserDetailsData v) => v.mobileNumber;
  static const Field<UserDetailsData, String> _f$mobileNumber = Field(
    'mobileNumber',
    _$mobileNumber,
    opt: true,
  );
  static String? _$status(UserDetailsData v) => v.status;
  static const Field<UserDetailsData, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static bool? _$isLicenseRequired(UserDetailsData v) => v.isLicenseRequired;
  static const Field<UserDetailsData, bool> _f$isLicenseRequired = Field(
    'isLicenseRequired',
    _$isLicenseRequired,
    opt: true,
  );
  static bool? _$isLicenseActive(UserDetailsData v) => v.isLicenseActive;
  static const Field<UserDetailsData, bool> _f$isLicenseActive = Field(
    'isLicenseActive',
    _$isLicenseActive,
    opt: true,
  );
  static bool? _$isPermitActive(UserDetailsData v) => v.isPermitActive;
  static const Field<UserDetailsData, bool> _f$isPermitActive = Field(
    'isPermitActive',
    _$isPermitActive,
    opt: true,
  );
  static List<StakeHolder>? _$stakeHolders(UserDetailsData v) => v.stakeHolders;
  static const Field<UserDetailsData, List<StakeHolder>> _f$stakeHolders =
      Field('stakeHolders', _$stakeHolders, opt: true);
  static List<String?>? _$userPorts(UserDetailsData v) => v.userPorts;
  static const Field<UserDetailsData, List<String?>> _f$userPorts = Field(
    'userPorts',
    _$userPorts,
    opt: true,
  );
  static UserOrganization? _$userOrganization(UserDetailsData v) =>
      v.userOrganization;
  static const Field<UserDetailsData, UserOrganization> _f$userOrganization =
      Field('userOrganization', _$userOrganization, opt: true);
  static UserBranch? _$userBranch(UserDetailsData v) => v.userBranch;
  static const Field<UserDetailsData, UserBranch> _f$userBranch = Field(
    'userBranch',
    _$userBranch,
    opt: true,
  );

  @override
  final MappableFields<UserDetailsData> fields = const {
    #createdBy: _f$createdBy,
    #createdDate: _f$createdDate,
    #updatedBy: _f$updatedBy,
    #updatedDate: _f$updatedDate,
    #isActive: _f$isActive,
    #id: _f$id,
    #appId: _f$appId,
    #employeeCode: _f$employeeCode,
    #repNo: _f$repNo,
    #repCode: _f$repCode,
    #employeeName: _f$employeeName,
    #joiningDate: _f$joiningDate,
    #departmentRid: _f$departmentRid,
    #departmentCode: _f$departmentCode,
    #departmentEn: _f$departmentEn,
    #departmentAr: _f$departmentAr,
    #designationRid: _f$designationRid,
    #designationCode: _f$designationCode,
    #designationEn: _f$designationEn,
    #designationAr: _f$designationAr,
    #portRid: _f$portRid,
    #portCode: _f$portCode,
    #portNameEng: _f$portNameEng,
    #portNameArb: _f$portNameArb,
    #defaultGroupTypeRid: _f$defaultGroupTypeRid,
    #defaultGroupTypeCode: _f$defaultGroupTypeCode,
    #defaultGroupTypeEn: _f$defaultGroupTypeEn,
    #defaultGroupTypeAr: _f$defaultGroupTypeAr,
    #idTypeRid: _f$idTypeRid,
    #idTypeCode: _f$idTypeCode,
    #idTypeEn: _f$idTypeEn,
    #idTypeAr: _f$idTypeAr,
    #idNo: _f$idNo,
    #idExpiryDate: _f$idExpiryDate,
    #nationality: _f$nationality,
    #nationalityCode: _f$nationalityCode,
    #nationalityEn: _f$nationalityEn,
    #nationalityAr: _f$nationalityAr,
    #dateOfBirth: _f$dateOfBirth,
    #genderRid: _f$genderRid,
    #genderEn: _f$genderEn,
    #genderAr: _f$genderAr,
    #salutationAr: _f$salutationAr,
    #salutationEn: _f$salutationEn,
    #firstNameEn: _f$firstNameEn,
    #middleNameEn: _f$middleNameEn,
    #lastNameEn: _f$lastNameEn,
    #firstNameAr: _f$firstNameAr,
    #middleNameAr: _f$middleNameAr,
    #lastNameAr: _f$lastNameAr,
    #iamUserId: _f$iamUserId,
    #userType: _f$userType,
    #userName: _f$userName,
    #profileImagePath: _f$profileImagePath,
    #emailId: _f$emailId,
    #mobileNumber: _f$mobileNumber,
    #status: _f$status,
    #isLicenseRequired: _f$isLicenseRequired,
    #isLicenseActive: _f$isLicenseActive,
    #isPermitActive: _f$isPermitActive,
    #stakeHolders: _f$stakeHolders,
    #userPorts: _f$userPorts,
    #userOrganization: _f$userOrganization,
    #userBranch: _f$userBranch,
  };
  @override
  final bool ignoreNull = true;

  static UserDetailsData _instantiate(DecodingData data) {
    return UserDetailsData(
      createdBy: data.dec(_f$createdBy),
      createdDate: data.dec(_f$createdDate),
      updatedBy: data.dec(_f$updatedBy),
      updatedDate: data.dec(_f$updatedDate),
      isActive: data.dec(_f$isActive),
      id: data.dec(_f$id),
      appId: data.dec(_f$appId),
      employeeCode: data.dec(_f$employeeCode),
      repNo: data.dec(_f$repNo),
      repCode: data.dec(_f$repCode),
      employeeName: data.dec(_f$employeeName),
      joiningDate: data.dec(_f$joiningDate),
      departmentRid: data.dec(_f$departmentRid),
      departmentCode: data.dec(_f$departmentCode),
      departmentEn: data.dec(_f$departmentEn),
      departmentAr: data.dec(_f$departmentAr),
      designationRid: data.dec(_f$designationRid),
      designationCode: data.dec(_f$designationCode),
      designationEn: data.dec(_f$designationEn),
      designationAr: data.dec(_f$designationAr),
      portRid: data.dec(_f$portRid),
      portCode: data.dec(_f$portCode),
      portNameEng: data.dec(_f$portNameEng),
      portNameArb: data.dec(_f$portNameArb),
      defaultGroupTypeRid: data.dec(_f$defaultGroupTypeRid),
      defaultGroupTypeCode: data.dec(_f$defaultGroupTypeCode),
      defaultGroupTypeEn: data.dec(_f$defaultGroupTypeEn),
      defaultGroupTypeAr: data.dec(_f$defaultGroupTypeAr),
      idTypeRid: data.dec(_f$idTypeRid),
      idTypeCode: data.dec(_f$idTypeCode),
      idTypeEn: data.dec(_f$idTypeEn),
      idTypeAr: data.dec(_f$idTypeAr),
      idNo: data.dec(_f$idNo),
      idExpiryDate: data.dec(_f$idExpiryDate),
      nationality: data.dec(_f$nationality),
      nationalityCode: data.dec(_f$nationalityCode),
      nationalityEn: data.dec(_f$nationalityEn),
      nationalityAr: data.dec(_f$nationalityAr),
      dateOfBirth: data.dec(_f$dateOfBirth),
      genderRid: data.dec(_f$genderRid),
      genderEn: data.dec(_f$genderEn),
      genderAr: data.dec(_f$genderAr),
      salutationAr: data.dec(_f$salutationAr),
      salutationEn: data.dec(_f$salutationEn),
      firstNameEn: data.dec(_f$firstNameEn),
      middleNameEn: data.dec(_f$middleNameEn),
      lastNameEn: data.dec(_f$lastNameEn),
      firstNameAr: data.dec(_f$firstNameAr),
      middleNameAr: data.dec(_f$middleNameAr),
      lastNameAr: data.dec(_f$lastNameAr),
      iamUserId: data.dec(_f$iamUserId),
      userType: data.dec(_f$userType),
      userName: data.dec(_f$userName),
      profileImagePath: data.dec(_f$profileImagePath),
      emailId: data.dec(_f$emailId),
      mobileNumber: data.dec(_f$mobileNumber),
      status: data.dec(_f$status),
      isLicenseRequired: data.dec(_f$isLicenseRequired),
      isLicenseActive: data.dec(_f$isLicenseActive),
      isPermitActive: data.dec(_f$isPermitActive),
      stakeHolders: data.dec(_f$stakeHolders),
      userPorts: data.dec(_f$userPorts),
      userOrganization: data.dec(_f$userOrganization),
      userBranch: data.dec(_f$userBranch),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserDetailsData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserDetailsData>(map);
  }

  static UserDetailsData fromJson(String json) {
    return ensureInitialized().decodeJson<UserDetailsData>(json);
  }
}

mixin UserDetailsDataMappable {
  String toJson() {
    return UserDetailsDataMapper.ensureInitialized()
        .encodeJson<UserDetailsData>(this as UserDetailsData);
  }

  Map<String, dynamic> toMap() {
    return UserDetailsDataMapper.ensureInitialized().encodeMap<UserDetailsData>(
      this as UserDetailsData,
    );
  }

  UserDetailsDataCopyWith<UserDetailsData, UserDetailsData, UserDetailsData>
  get copyWith =>
      _UserDetailsDataCopyWithImpl<UserDetailsData, UserDetailsData>(
        this as UserDetailsData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserDetailsDataMapper.ensureInitialized().stringifyValue(
      this as UserDetailsData,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserDetailsDataMapper.ensureInitialized().equalsValue(
      this as UserDetailsData,
      other,
    );
  }

  @override
  int get hashCode {
    return UserDetailsDataMapper.ensureInitialized().hashValue(
      this as UserDetailsData,
    );
  }
}

extension UserDetailsDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserDetailsData, $Out> {
  UserDetailsDataCopyWith<$R, UserDetailsData, $Out> get $asUserDetailsData =>
      $base.as((v, t, t2) => _UserDetailsDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserDetailsDataCopyWith<$R, $In extends UserDetailsData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    StakeHolder,
    StakeHolderCopyWith<$R, StakeHolder, StakeHolder>
  >?
  get stakeHolders;
  ListCopyWith<$R, String?, ObjectCopyWith<$R, String?, String?>?>?
  get userPorts;
  UserOrganizationCopyWith<$R, UserOrganization, UserOrganization>?
  get userOrganization;
  UserBranchCopyWith<$R, UserBranch, UserBranch>? get userBranch;
  $R call({
    String? createdBy,
    String? createdDate,
    String? updatedBy,
    String? updatedDate,
    bool? isActive,
    int? id,
    int? appId,
    String? employeeCode,
    String? repNo,
    String? repCode,
    String? employeeName,
    String? joiningDate,
    int? departmentRid,
    String? departmentCode,
    String? departmentEn,
    String? departmentAr,
    int? designationRid,
    String? designationCode,
    String? designationEn,
    String? designationAr,
    int? portRid,
    String? portCode,
    String? portNameEng,
    String? portNameArb,
    int? defaultGroupTypeRid,
    String? defaultGroupTypeCode,
    String? defaultGroupTypeEn,
    String? defaultGroupTypeAr,
    int? idTypeRid,
    String? idTypeCode,
    String? idTypeEn,
    String? idTypeAr,
    int? idNo,
    String? idExpiryDate,
    String? nationality,
    String? nationalityCode,
    String? nationalityEn,
    String? nationalityAr,
    String? dateOfBirth,
    String? genderRid,
    String? genderEn,
    String? genderAr,
    String? salutationAr,
    String? salutationEn,
    String? firstNameEn,
    String? middleNameEn,
    String? lastNameEn,
    String? firstNameAr,
    String? middleNameAr,
    String? lastNameAr,
    String? iamUserId,
    String? userType,
    String? userName,
    String? profileImagePath,
    String? emailId,
    String? mobileNumber,
    String? status,
    bool? isLicenseRequired,
    bool? isLicenseActive,
    bool? isPermitActive,
    List<StakeHolder>? stakeHolders,
    List<String?>? userPorts,
    UserOrganization? userOrganization,
    UserBranch? userBranch,
  });
  UserDetailsDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserDetailsDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserDetailsData, $Out>
    implements UserDetailsDataCopyWith<$R, UserDetailsData, $Out> {
  _UserDetailsDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserDetailsData> $mapper =
      UserDetailsDataMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    StakeHolder,
    StakeHolderCopyWith<$R, StakeHolder, StakeHolder>
  >?
  get stakeHolders => $value.stakeHolders != null
      ? ListCopyWith(
          $value.stakeHolders!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(stakeHolders: v),
        )
      : null;
  @override
  ListCopyWith<$R, String?, ObjectCopyWith<$R, String?, String?>?>?
  get userPorts => $value.userPorts != null
      ? ListCopyWith(
          $value.userPorts!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(userPorts: v),
        )
      : null;
  @override
  UserOrganizationCopyWith<$R, UserOrganization, UserOrganization>?
  get userOrganization => $value.userOrganization?.copyWith.$chain(
    (v) => call(userOrganization: v),
  );
  @override
  UserBranchCopyWith<$R, UserBranch, UserBranch>? get userBranch =>
      $value.userBranch?.copyWith.$chain((v) => call(userBranch: v));
  @override
  $R call({
    Object? createdBy = $none,
    Object? createdDate = $none,
    Object? updatedBy = $none,
    Object? updatedDate = $none,
    Object? isActive = $none,
    Object? id = $none,
    Object? appId = $none,
    Object? employeeCode = $none,
    Object? repNo = $none,
    Object? repCode = $none,
    Object? employeeName = $none,
    Object? joiningDate = $none,
    Object? departmentRid = $none,
    Object? departmentCode = $none,
    Object? departmentEn = $none,
    Object? departmentAr = $none,
    Object? designationRid = $none,
    Object? designationCode = $none,
    Object? designationEn = $none,
    Object? designationAr = $none,
    int? portRid,
    Object? portCode = $none,
    Object? portNameEng = $none,
    Object? portNameArb = $none,
    Object? defaultGroupTypeRid = $none,
    Object? defaultGroupTypeCode = $none,
    Object? defaultGroupTypeEn = $none,
    Object? defaultGroupTypeAr = $none,
    Object? idTypeRid = $none,
    Object? idTypeCode = $none,
    Object? idTypeEn = $none,
    Object? idTypeAr = $none,
    Object? idNo = $none,
    Object? idExpiryDate = $none,
    Object? nationality = $none,
    Object? nationalityCode = $none,
    Object? nationalityEn = $none,
    Object? nationalityAr = $none,
    Object? dateOfBirth = $none,
    Object? genderRid = $none,
    Object? genderEn = $none,
    Object? genderAr = $none,
    Object? salutationAr = $none,
    Object? salutationEn = $none,
    Object? firstNameEn = $none,
    Object? middleNameEn = $none,
    Object? lastNameEn = $none,
    Object? firstNameAr = $none,
    Object? middleNameAr = $none,
    Object? lastNameAr = $none,
    Object? iamUserId = $none,
    Object? userType = $none,
    Object? userName = $none,
    Object? profileImagePath = $none,
    Object? emailId = $none,
    Object? mobileNumber = $none,
    Object? status = $none,
    Object? isLicenseRequired = $none,
    Object? isLicenseActive = $none,
    Object? isPermitActive = $none,
    Object? stakeHolders = $none,
    Object? userPorts = $none,
    Object? userOrganization = $none,
    Object? userBranch = $none,
  }) => $apply(
    FieldCopyWithData({
      if (createdBy != $none) #createdBy: createdBy,
      if (createdDate != $none) #createdDate: createdDate,
      if (updatedBy != $none) #updatedBy: updatedBy,
      if (updatedDate != $none) #updatedDate: updatedDate,
      if (isActive != $none) #isActive: isActive,
      if (id != $none) #id: id,
      if (appId != $none) #appId: appId,
      if (employeeCode != $none) #employeeCode: employeeCode,
      if (repNo != $none) #repNo: repNo,
      if (repCode != $none) #repCode: repCode,
      if (employeeName != $none) #employeeName: employeeName,
      if (joiningDate != $none) #joiningDate: joiningDate,
      if (departmentRid != $none) #departmentRid: departmentRid,
      if (departmentCode != $none) #departmentCode: departmentCode,
      if (departmentEn != $none) #departmentEn: departmentEn,
      if (departmentAr != $none) #departmentAr: departmentAr,
      if (designationRid != $none) #designationRid: designationRid,
      if (designationCode != $none) #designationCode: designationCode,
      if (designationEn != $none) #designationEn: designationEn,
      if (designationAr != $none) #designationAr: designationAr,
      if (portRid != null) #portRid: portRid,
      if (portCode != $none) #portCode: portCode,
      if (portNameEng != $none) #portNameEng: portNameEng,
      if (portNameArb != $none) #portNameArb: portNameArb,
      if (defaultGroupTypeRid != $none)
        #defaultGroupTypeRid: defaultGroupTypeRid,
      if (defaultGroupTypeCode != $none)
        #defaultGroupTypeCode: defaultGroupTypeCode,
      if (defaultGroupTypeEn != $none) #defaultGroupTypeEn: defaultGroupTypeEn,
      if (defaultGroupTypeAr != $none) #defaultGroupTypeAr: defaultGroupTypeAr,
      if (idTypeRid != $none) #idTypeRid: idTypeRid,
      if (idTypeCode != $none) #idTypeCode: idTypeCode,
      if (idTypeEn != $none) #idTypeEn: idTypeEn,
      if (idTypeAr != $none) #idTypeAr: idTypeAr,
      if (idNo != $none) #idNo: idNo,
      if (idExpiryDate != $none) #idExpiryDate: idExpiryDate,
      if (nationality != $none) #nationality: nationality,
      if (nationalityCode != $none) #nationalityCode: nationalityCode,
      if (nationalityEn != $none) #nationalityEn: nationalityEn,
      if (nationalityAr != $none) #nationalityAr: nationalityAr,
      if (dateOfBirth != $none) #dateOfBirth: dateOfBirth,
      if (genderRid != $none) #genderRid: genderRid,
      if (genderEn != $none) #genderEn: genderEn,
      if (genderAr != $none) #genderAr: genderAr,
      if (salutationAr != $none) #salutationAr: salutationAr,
      if (salutationEn != $none) #salutationEn: salutationEn,
      if (firstNameEn != $none) #firstNameEn: firstNameEn,
      if (middleNameEn != $none) #middleNameEn: middleNameEn,
      if (lastNameEn != $none) #lastNameEn: lastNameEn,
      if (firstNameAr != $none) #firstNameAr: firstNameAr,
      if (middleNameAr != $none) #middleNameAr: middleNameAr,
      if (lastNameAr != $none) #lastNameAr: lastNameAr,
      if (iamUserId != $none) #iamUserId: iamUserId,
      if (userType != $none) #userType: userType,
      if (userName != $none) #userName: userName,
      if (profileImagePath != $none) #profileImagePath: profileImagePath,
      if (emailId != $none) #emailId: emailId,
      if (mobileNumber != $none) #mobileNumber: mobileNumber,
      if (status != $none) #status: status,
      if (isLicenseRequired != $none) #isLicenseRequired: isLicenseRequired,
      if (isLicenseActive != $none) #isLicenseActive: isLicenseActive,
      if (isPermitActive != $none) #isPermitActive: isPermitActive,
      if (stakeHolders != $none) #stakeHolders: stakeHolders,
      if (userPorts != $none) #userPorts: userPorts,
      if (userOrganization != $none) #userOrganization: userOrganization,
      if (userBranch != $none) #userBranch: userBranch,
    }),
  );
  @override
  UserDetailsData $make(CopyWithData data) => UserDetailsData(
    createdBy: data.get(#createdBy, or: $value.createdBy),
    createdDate: data.get(#createdDate, or: $value.createdDate),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
    updatedDate: data.get(#updatedDate, or: $value.updatedDate),
    isActive: data.get(#isActive, or: $value.isActive),
    id: data.get(#id, or: $value.id),
    appId: data.get(#appId, or: $value.appId),
    employeeCode: data.get(#employeeCode, or: $value.employeeCode),
    repNo: data.get(#repNo, or: $value.repNo),
    repCode: data.get(#repCode, or: $value.repCode),
    employeeName: data.get(#employeeName, or: $value.employeeName),
    joiningDate: data.get(#joiningDate, or: $value.joiningDate),
    departmentRid: data.get(#departmentRid, or: $value.departmentRid),
    departmentCode: data.get(#departmentCode, or: $value.departmentCode),
    departmentEn: data.get(#departmentEn, or: $value.departmentEn),
    departmentAr: data.get(#departmentAr, or: $value.departmentAr),
    designationRid: data.get(#designationRid, or: $value.designationRid),
    designationCode: data.get(#designationCode, or: $value.designationCode),
    designationEn: data.get(#designationEn, or: $value.designationEn),
    designationAr: data.get(#designationAr, or: $value.designationAr),
    portRid: data.get(#portRid, or: $value.portRid),
    portCode: data.get(#portCode, or: $value.portCode),
    portNameEng: data.get(#portNameEng, or: $value.portNameEng),
    portNameArb: data.get(#portNameArb, or: $value.portNameArb),
    defaultGroupTypeRid: data.get(
      #defaultGroupTypeRid,
      or: $value.defaultGroupTypeRid,
    ),
    defaultGroupTypeCode: data.get(
      #defaultGroupTypeCode,
      or: $value.defaultGroupTypeCode,
    ),
    defaultGroupTypeEn: data.get(
      #defaultGroupTypeEn,
      or: $value.defaultGroupTypeEn,
    ),
    defaultGroupTypeAr: data.get(
      #defaultGroupTypeAr,
      or: $value.defaultGroupTypeAr,
    ),
    idTypeRid: data.get(#idTypeRid, or: $value.idTypeRid),
    idTypeCode: data.get(#idTypeCode, or: $value.idTypeCode),
    idTypeEn: data.get(#idTypeEn, or: $value.idTypeEn),
    idTypeAr: data.get(#idTypeAr, or: $value.idTypeAr),
    idNo: data.get(#idNo, or: $value.idNo),
    idExpiryDate: data.get(#idExpiryDate, or: $value.idExpiryDate),
    nationality: data.get(#nationality, or: $value.nationality),
    nationalityCode: data.get(#nationalityCode, or: $value.nationalityCode),
    nationalityEn: data.get(#nationalityEn, or: $value.nationalityEn),
    nationalityAr: data.get(#nationalityAr, or: $value.nationalityAr),
    dateOfBirth: data.get(#dateOfBirth, or: $value.dateOfBirth),
    genderRid: data.get(#genderRid, or: $value.genderRid),
    genderEn: data.get(#genderEn, or: $value.genderEn),
    genderAr: data.get(#genderAr, or: $value.genderAr),
    salutationAr: data.get(#salutationAr, or: $value.salutationAr),
    salutationEn: data.get(#salutationEn, or: $value.salutationEn),
    firstNameEn: data.get(#firstNameEn, or: $value.firstNameEn),
    middleNameEn: data.get(#middleNameEn, or: $value.middleNameEn),
    lastNameEn: data.get(#lastNameEn, or: $value.lastNameEn),
    firstNameAr: data.get(#firstNameAr, or: $value.firstNameAr),
    middleNameAr: data.get(#middleNameAr, or: $value.middleNameAr),
    lastNameAr: data.get(#lastNameAr, or: $value.lastNameAr),
    iamUserId: data.get(#iamUserId, or: $value.iamUserId),
    userType: data.get(#userType, or: $value.userType),
    userName: data.get(#userName, or: $value.userName),
    profileImagePath: data.get(#profileImagePath, or: $value.profileImagePath),
    emailId: data.get(#emailId, or: $value.emailId),
    mobileNumber: data.get(#mobileNumber, or: $value.mobileNumber),
    status: data.get(#status, or: $value.status),
    isLicenseRequired: data.get(
      #isLicenseRequired,
      or: $value.isLicenseRequired,
    ),
    isLicenseActive: data.get(#isLicenseActive, or: $value.isLicenseActive),
    isPermitActive: data.get(#isPermitActive, or: $value.isPermitActive),
    stakeHolders: data.get(#stakeHolders, or: $value.stakeHolders),
    userPorts: data.get(#userPorts, or: $value.userPorts),
    userOrganization: data.get(#userOrganization, or: $value.userOrganization),
    userBranch: data.get(#userBranch, or: $value.userBranch),
  );

  @override
  UserDetailsDataCopyWith<$R2, UserDetailsData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserDetailsDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StakeHolderMapper extends ClassMapperBase<StakeHolder> {
  StakeHolderMapper._();

  static StakeHolderMapper? _instance;
  static StakeHolderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StakeHolderMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'StakeHolder';

  static String? _$roleId(StakeHolder v) => v.roleId;
  static const Field<StakeHolder, String> _f$roleId = Field(
    'roleId',
    _$roleId,
    opt: true,
  );
  static String? _$stakeholderCode(StakeHolder v) => v.stakeholderCode;
  static const Field<StakeHolder, String> _f$stakeholderCode = Field(
    'stakeholderCode',
    _$stakeholderCode,
    opt: true,
  );
  static String? _$stakeholderNameEng(StakeHolder v) => v.stakeholderNameEng;
  static const Field<StakeHolder, String> _f$stakeholderNameEng = Field(
    'stakeholderNameEng',
    _$stakeholderNameEng,
    opt: true,
  );
  static String? _$stakeholderNameArabic(StakeHolder v) =>
      v.stakeholderNameArabic;
  static const Field<StakeHolder, String> _f$stakeholderNameArabic = Field(
    'stakeholderNameArabic',
    _$stakeholderNameArabic,
    opt: true,
  );
  static int? _$stakeholderTypeId(StakeHolder v) => v.stakeholderTypeId;
  static const Field<StakeHolder, int> _f$stakeholderTypeId = Field(
    'stakeholderTypeId',
    _$stakeholderTypeId,
    opt: true,
  );
  static String? _$subRoleId(StakeHolder v) => v.subRoleId;
  static const Field<StakeHolder, String> _f$subRoleId = Field(
    'subRoleId',
    _$subRoleId,
    opt: true,
  );
  static String? _$stakeholderSubRoleId(StakeHolder v) =>
      v.stakeholderSubRoleId;
  static const Field<StakeHolder, String> _f$stakeholderSubRoleId = Field(
    'stakeholderSubRoleId',
    _$stakeholderSubRoleId,
    opt: true,
  );
  static String? _$stakeholderSubRoleCode(StakeHolder v) =>
      v.stakeholderSubRoleCode;
  static const Field<StakeHolder, String> _f$stakeholderSubRoleCode = Field(
    'stakeholderSubRoleCode',
    _$stakeholderSubRoleCode,
    opt: true,
  );
  static String? _$stakeholderTypeSubRoleNameEng(StakeHolder v) =>
      v.stakeholderTypeSubRoleNameEng;
  static const Field<StakeHolder, String> _f$stakeholderTypeSubRoleNameEng =
      Field(
        'stakeholderTypeSubRoleNameEng',
        _$stakeholderTypeSubRoleNameEng,
        opt: true,
      );
  static String? _$stakeholderTypeSubRoleNameArabic(StakeHolder v) =>
      v.stakeholderTypeSubRoleNameArabic;
  static const Field<StakeHolder, String> _f$stakeholderTypeSubRoleNameArabic =
      Field(
        'stakeholderTypeSubRoleNameArabic',
        _$stakeholderTypeSubRoleNameArabic,
        opt: true,
      );
  static bool? _$isLicenseRequired(StakeHolder v) => v.isLicenseRequired;
  static const Field<StakeHolder, bool> _f$isLicenseRequired = Field(
    'isLicenseRequired',
    _$isLicenseRequired,
    opt: true,
  );

  @override
  final MappableFields<StakeHolder> fields = const {
    #roleId: _f$roleId,
    #stakeholderCode: _f$stakeholderCode,
    #stakeholderNameEng: _f$stakeholderNameEng,
    #stakeholderNameArabic: _f$stakeholderNameArabic,
    #stakeholderTypeId: _f$stakeholderTypeId,
    #subRoleId: _f$subRoleId,
    #stakeholderSubRoleId: _f$stakeholderSubRoleId,
    #stakeholderSubRoleCode: _f$stakeholderSubRoleCode,
    #stakeholderTypeSubRoleNameEng: _f$stakeholderTypeSubRoleNameEng,
    #stakeholderTypeSubRoleNameArabic: _f$stakeholderTypeSubRoleNameArabic,
    #isLicenseRequired: _f$isLicenseRequired,
  };
  @override
  final bool ignoreNull = true;

  static StakeHolder _instantiate(DecodingData data) {
    return StakeHolder(
      roleId: data.dec(_f$roleId),
      stakeholderCode: data.dec(_f$stakeholderCode),
      stakeholderNameEng: data.dec(_f$stakeholderNameEng),
      stakeholderNameArabic: data.dec(_f$stakeholderNameArabic),
      stakeholderTypeId: data.dec(_f$stakeholderTypeId),
      subRoleId: data.dec(_f$subRoleId),
      stakeholderSubRoleId: data.dec(_f$stakeholderSubRoleId),
      stakeholderSubRoleCode: data.dec(_f$stakeholderSubRoleCode),
      stakeholderTypeSubRoleNameEng: data.dec(_f$stakeholderTypeSubRoleNameEng),
      stakeholderTypeSubRoleNameArabic: data.dec(
        _f$stakeholderTypeSubRoleNameArabic,
      ),
      isLicenseRequired: data.dec(_f$isLicenseRequired),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StakeHolder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StakeHolder>(map);
  }

  static StakeHolder fromJson(String json) {
    return ensureInitialized().decodeJson<StakeHolder>(json);
  }
}

mixin StakeHolderMappable {
  String toJson() {
    return StakeHolderMapper.ensureInitialized().encodeJson<StakeHolder>(
      this as StakeHolder,
    );
  }

  Map<String, dynamic> toMap() {
    return StakeHolderMapper.ensureInitialized().encodeMap<StakeHolder>(
      this as StakeHolder,
    );
  }

  StakeHolderCopyWith<StakeHolder, StakeHolder, StakeHolder> get copyWith =>
      _StakeHolderCopyWithImpl<StakeHolder, StakeHolder>(
        this as StakeHolder,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StakeHolderMapper.ensureInitialized().stringifyValue(
      this as StakeHolder,
    );
  }

  @override
  bool operator ==(Object other) {
    return StakeHolderMapper.ensureInitialized().equalsValue(
      this as StakeHolder,
      other,
    );
  }

  @override
  int get hashCode {
    return StakeHolderMapper.ensureInitialized().hashValue(this as StakeHolder);
  }
}

extension StakeHolderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StakeHolder, $Out> {
  StakeHolderCopyWith<$R, StakeHolder, $Out> get $asStakeHolder =>
      $base.as((v, t, t2) => _StakeHolderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StakeHolderCopyWith<$R, $In extends StakeHolder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? roleId,
    String? stakeholderCode,
    String? stakeholderNameEng,
    String? stakeholderNameArabic,
    int? stakeholderTypeId,
    String? subRoleId,
    String? stakeholderSubRoleId,
    String? stakeholderSubRoleCode,
    String? stakeholderTypeSubRoleNameEng,
    String? stakeholderTypeSubRoleNameArabic,
    bool? isLicenseRequired,
  });
  StakeHolderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StakeHolderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StakeHolder, $Out>
    implements StakeHolderCopyWith<$R, StakeHolder, $Out> {
  _StakeHolderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StakeHolder> $mapper =
      StakeHolderMapper.ensureInitialized();
  @override
  $R call({
    Object? roleId = $none,
    Object? stakeholderCode = $none,
    Object? stakeholderNameEng = $none,
    Object? stakeholderNameArabic = $none,
    Object? stakeholderTypeId = $none,
    Object? subRoleId = $none,
    Object? stakeholderSubRoleId = $none,
    Object? stakeholderSubRoleCode = $none,
    Object? stakeholderTypeSubRoleNameEng = $none,
    Object? stakeholderTypeSubRoleNameArabic = $none,
    Object? isLicenseRequired = $none,
  }) => $apply(
    FieldCopyWithData({
      if (roleId != $none) #roleId: roleId,
      if (stakeholderCode != $none) #stakeholderCode: stakeholderCode,
      if (stakeholderNameEng != $none) #stakeholderNameEng: stakeholderNameEng,
      if (stakeholderNameArabic != $none)
        #stakeholderNameArabic: stakeholderNameArabic,
      if (stakeholderTypeId != $none) #stakeholderTypeId: stakeholderTypeId,
      if (subRoleId != $none) #subRoleId: subRoleId,
      if (stakeholderSubRoleId != $none)
        #stakeholderSubRoleId: stakeholderSubRoleId,
      if (stakeholderSubRoleCode != $none)
        #stakeholderSubRoleCode: stakeholderSubRoleCode,
      if (stakeholderTypeSubRoleNameEng != $none)
        #stakeholderTypeSubRoleNameEng: stakeholderTypeSubRoleNameEng,
      if (stakeholderTypeSubRoleNameArabic != $none)
        #stakeholderTypeSubRoleNameArabic: stakeholderTypeSubRoleNameArabic,
      if (isLicenseRequired != $none) #isLicenseRequired: isLicenseRequired,
    }),
  );
  @override
  StakeHolder $make(CopyWithData data) => StakeHolder(
    roleId: data.get(#roleId, or: $value.roleId),
    stakeholderCode: data.get(#stakeholderCode, or: $value.stakeholderCode),
    stakeholderNameEng: data.get(
      #stakeholderNameEng,
      or: $value.stakeholderNameEng,
    ),
    stakeholderNameArabic: data.get(
      #stakeholderNameArabic,
      or: $value.stakeholderNameArabic,
    ),
    stakeholderTypeId: data.get(
      #stakeholderTypeId,
      or: $value.stakeholderTypeId,
    ),
    subRoleId: data.get(#subRoleId, or: $value.subRoleId),
    stakeholderSubRoleId: data.get(
      #stakeholderSubRoleId,
      or: $value.stakeholderSubRoleId,
    ),
    stakeholderSubRoleCode: data.get(
      #stakeholderSubRoleCode,
      or: $value.stakeholderSubRoleCode,
    ),
    stakeholderTypeSubRoleNameEng: data.get(
      #stakeholderTypeSubRoleNameEng,
      or: $value.stakeholderTypeSubRoleNameEng,
    ),
    stakeholderTypeSubRoleNameArabic: data.get(
      #stakeholderTypeSubRoleNameArabic,
      or: $value.stakeholderTypeSubRoleNameArabic,
    ),
    isLicenseRequired: data.get(
      #isLicenseRequired,
      or: $value.isLicenseRequired,
    ),
  );

  @override
  StakeHolderCopyWith<$R2, StakeHolder, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StakeHolderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserOrganizationMapper extends ClassMapperBase<UserOrganization> {
  UserOrganizationMapper._();

  static UserOrganizationMapper? _instance;
  static UserOrganizationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserOrganizationMapper._());
      UserLicenseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserOrganization';

  static String? _$createdBy(UserOrganization v) => v.createdBy;
  static const Field<UserOrganization, String> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    opt: true,
  );
  static String? _$createdDate(UserOrganization v) => v.createdDate;
  static const Field<UserOrganization, String> _f$createdDate = Field(
    'createdDate',
    _$createdDate,
    opt: true,
  );
  static String? _$updatedBy(UserOrganization v) => v.updatedBy;
  static const Field<UserOrganization, String> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    opt: true,
  );
  static String? _$updatedDate(UserOrganization v) => v.updatedDate;
  static const Field<UserOrganization, String> _f$updatedDate = Field(
    'updatedDate',
    _$updatedDate,
    opt: true,
  );
  static bool? _$isActive(UserOrganization v) => v.isActive;
  static const Field<UserOrganization, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
  );
  static String? _$registrationThroughCode(UserOrganization v) =>
      v.registrationThroughCode;
  static const Field<UserOrganization, String> _f$registrationThroughCode =
      Field('registrationThroughCode', _$registrationThroughCode, opt: true);
  static String? _$registrationThroughEn(UserOrganization v) =>
      v.registrationThroughEn;
  static const Field<UserOrganization, String> _f$registrationThroughEn = Field(
    'registrationThroughEn',
    _$registrationThroughEn,
    opt: true,
  );
  static String? _$registrationThroughAr(UserOrganization v) =>
      v.registrationThroughAr;
  static const Field<UserOrganization, String> _f$registrationThroughAr = Field(
    'registrationThroughAr',
    _$registrationThroughAr,
    opt: true,
  );
  static String? _$registrationTypeCode(UserOrganization v) =>
      v.registrationTypeCode;
  static const Field<UserOrganization, String> _f$registrationTypeCode = Field(
    'registrationTypeCode',
    _$registrationTypeCode,
    opt: true,
  );
  static String? _$registrationTypeEn(UserOrganization v) =>
      v.registrationTypeEn;
  static const Field<UserOrganization, String> _f$registrationTypeEn = Field(
    'registrationTypeEn',
    _$registrationTypeEn,
    opt: true,
  );
  static String? _$registrationTypeAr(UserOrganization v) =>
      v.registrationTypeAr;
  static const Field<UserOrganization, String> _f$registrationTypeAr = Field(
    'registrationTypeAr',
    _$registrationTypeAr,
    opt: true,
  );
  static String? _$orgIdTypeCode(UserOrganization v) => v.orgIdTypeCode;
  static const Field<UserOrganization, String> _f$orgIdTypeCode = Field(
    'orgIdTypeCode',
    _$orgIdTypeCode,
    opt: true,
  );
  static String? _$orgIdTypeEn(UserOrganization v) => v.orgIdTypeEn;
  static const Field<UserOrganization, String> _f$orgIdTypeEn = Field(
    'orgIdTypeEn',
    _$orgIdTypeEn,
    opt: true,
  );
  static String? _$orgIdTypeAr(UserOrganization v) => v.orgIdTypeAr;
  static const Field<UserOrganization, String> _f$orgIdTypeAr = Field(
    'orgIdTypeAr',
    _$orgIdTypeAr,
    opt: true,
  );
  static int? _$id(UserOrganization v) => v.id;
  static const Field<UserOrganization, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static int? _$crn(UserOrganization v) => v.crn;
  static const Field<UserOrganization, int> _f$crn = Field(
    'crn',
    _$crn,
    opt: true,
  );
  static String? _$orgId(UserOrganization v) => v.orgId;
  static const Field<UserOrganization, String> _f$orgId = Field(
    'orgId',
    _$orgId,
    opt: true,
  );
  static String? _$orgNameEn(UserOrganization v) => v.orgNameEn;
  static const Field<UserOrganization, String> _f$orgNameEn = Field(
    'orgNameEn',
    _$orgNameEn,
    opt: true,
  );
  static String? _$orgNameAr(UserOrganization v) => v.orgNameAr;
  static const Field<UserOrganization, String> _f$orgNameAr = Field(
    'orgNameAr',
    _$orgNameAr,
    opt: true,
  );
  static int? _$registrationThroughRid(UserOrganization v) =>
      v.registrationThroughRid;
  static const Field<UserOrganization, int> _f$registrationThroughRid = Field(
    'registrationThroughRid',
    _$registrationThroughRid,
    opt: true,
  );
  static int? _$registrationTypeRid(UserOrganization v) =>
      v.registrationTypeRid;
  static const Field<UserOrganization, int> _f$registrationTypeRid = Field(
    'registrationTypeRid',
    _$registrationTypeRid,
    opt: true,
  );
  static String? _$documentNumber(UserOrganization v) => v.documentNumber;
  static const Field<UserOrganization, String> _f$documentNumber = Field(
    'documentNumber',
    _$documentNumber,
    opt: true,
  );
  static String? _$unitNo(UserOrganization v) => v.unitNo;
  static const Field<UserOrganization, String> _f$unitNo = Field(
    'unitNo',
    _$unitNo,
    opt: true,
  );
  static int? _$zipCode(UserOrganization v) => v.zipCode;
  static const Field<UserOrganization, int> _f$zipCode = Field(
    'zipCode',
    _$zipCode,
    opt: true,
  );
  static String? _$buildingNo(UserOrganization v) => v.buildingNo;
  static const Field<UserOrganization, String> _f$buildingNo = Field(
    'buildingNo',
    _$buildingNo,
    opt: true,
  );
  static String? _$street(UserOrganization v) => v.street;
  static const Field<UserOrganization, String> _f$street = Field(
    'street',
    _$street,
    opt: true,
  );
  static String? _$address(UserOrganization v) => v.address;
  static const Field<UserOrganization, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$fileName(UserOrganization v) => v.fileName;
  static const Field<UserOrganization, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static String? _$filePath(UserOrganization v) => v.filePath;
  static const Field<UserOrganization, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    opt: true,
  );
  static int? _$approvalStatusRid(UserOrganization v) => v.approvalStatusRid;
  static const Field<UserOrganization, int> _f$approvalStatusRid = Field(
    'approvalStatusRid',
    _$approvalStatusRid,
    opt: true,
  );
  static String? _$orgEmail(UserOrganization v) => v.orgEmail;
  static const Field<UserOrganization, String> _f$orgEmail = Field(
    'orgEmail',
    _$orgEmail,
    opt: true,
  );
  static String? _$district(UserOrganization v) => v.district;
  static const Field<UserOrganization, String> _f$district = Field(
    'district',
    _$district,
    opt: true,
  );
  static String? _$documentStatus(UserOrganization v) => v.documentStatus;
  static const Field<UserOrganization, String> _f$documentStatus = Field(
    'documentStatus',
    _$documentStatus,
    opt: true,
  );
  static String? _$stakeholderTypeRid(UserOrganization v) =>
      v.stakeholderTypeRid;
  static const Field<UserOrganization, String> _f$stakeholderTypeRid = Field(
    'stakeholderTypeRid',
    _$stakeholderTypeRid,
    opt: true,
  );
  static String? _$stakeholderTypeNameEng(UserOrganization v) =>
      v.stakeholderTypeNameEng;
  static const Field<UserOrganization, String> _f$stakeholderTypeNameEng =
      Field('stakeholderTypeNameEng', _$stakeholderTypeNameEng, opt: true);
  static String? _$stakeholderTypeNameArabic(UserOrganization v) =>
      v.stakeholderTypeNameArabic;
  static const Field<UserOrganization, String> _f$stakeholderTypeNameArabic =
      Field(
        'stakeholderTypeNameArabic',
        _$stakeholderTypeNameArabic,
        opt: true,
      );
  static int? _$cityRid(UserOrganization v) => v.cityRid;
  static const Field<UserOrganization, int> _f$cityRid = Field(
    'cityRid',
    _$cityRid,
    opt: true,
  );
  static String? _$userName(UserOrganization v) => v.userName;
  static const Field<UserOrganization, String> _f$userName = Field(
    'userName',
    _$userName,
    opt: true,
  );
  static String? _$orgIdType(UserOrganization v) => v.orgIdType;
  static const Field<UserOrganization, String> _f$orgIdType = Field(
    'orgIdType',
    _$orgIdType,
    opt: true,
  );
  static String? _$orgIdNo(UserOrganization v) => v.orgIdNo;
  static const Field<UserOrganization, String> _f$orgIdNo = Field(
    'orgIdNo',
    _$orgIdNo,
    opt: true,
  );
  static String? _$orgIdExpiryDate(UserOrganization v) => v.orgIdExpiryDate;
  static const Field<UserOrganization, String> _f$orgIdExpiryDate = Field(
    'orgIdExpiryDate',
    _$orgIdExpiryDate,
    opt: true,
  );
  static String? _$orgNationality(UserOrganization v) => v.orgNationality;
  static const Field<UserOrganization, String> _f$orgNationality = Field(
    'orgNationality',
    _$orgNationality,
    opt: true,
  );
  static int? _$orgMobile(UserOrganization v) => v.orgMobile;
  static const Field<UserOrganization, int> _f$orgMobile = Field(
    'orgMobile',
    _$orgMobile,
    opt: true,
  );
  static String? _$licenseNo(UserOrganization v) => v.licenseNo;
  static const Field<UserOrganization, String> _f$licenseNo = Field(
    'licenseNo',
    _$licenseNo,
    opt: true,
  );
  static String? _$licenseExpiryDate(UserOrganization v) => v.licenseExpiryDate;
  static const Field<UserOrganization, String> _f$licenseExpiryDate = Field(
    'licenseExpiryDate',
    _$licenseExpiryDate,
    opt: true,
  );
  static bool? _$isRegistrationApproved(UserOrganization v) =>
      v.isRegistrationApproved;
  static const Field<UserOrganization, bool> _f$isRegistrationApproved = Field(
    'isRegistrationApproved',
    _$isRegistrationApproved,
    opt: true,
  );
  static bool? _$isLicenseUser(UserOrganization v) => v.isLicenseUser;
  static const Field<UserOrganization, bool> _f$isLicenseUser = Field(
    'isLicenseUser',
    _$isLicenseUser,
    opt: true,
  );
  static List<UserLicense>? _$userLicense(UserOrganization v) => v.userLicense;
  static const Field<UserOrganization, List<UserLicense>> _f$userLicense =
      Field('userLicense', _$userLicense, opt: true);

  @override
  final MappableFields<UserOrganization> fields = const {
    #createdBy: _f$createdBy,
    #createdDate: _f$createdDate,
    #updatedBy: _f$updatedBy,
    #updatedDate: _f$updatedDate,
    #isActive: _f$isActive,
    #registrationThroughCode: _f$registrationThroughCode,
    #registrationThroughEn: _f$registrationThroughEn,
    #registrationThroughAr: _f$registrationThroughAr,
    #registrationTypeCode: _f$registrationTypeCode,
    #registrationTypeEn: _f$registrationTypeEn,
    #registrationTypeAr: _f$registrationTypeAr,
    #orgIdTypeCode: _f$orgIdTypeCode,
    #orgIdTypeEn: _f$orgIdTypeEn,
    #orgIdTypeAr: _f$orgIdTypeAr,
    #id: _f$id,
    #crn: _f$crn,
    #orgId: _f$orgId,
    #orgNameEn: _f$orgNameEn,
    #orgNameAr: _f$orgNameAr,
    #registrationThroughRid: _f$registrationThroughRid,
    #registrationTypeRid: _f$registrationTypeRid,
    #documentNumber: _f$documentNumber,
    #unitNo: _f$unitNo,
    #zipCode: _f$zipCode,
    #buildingNo: _f$buildingNo,
    #street: _f$street,
    #address: _f$address,
    #fileName: _f$fileName,
    #filePath: _f$filePath,
    #approvalStatusRid: _f$approvalStatusRid,
    #orgEmail: _f$orgEmail,
    #district: _f$district,
    #documentStatus: _f$documentStatus,
    #stakeholderTypeRid: _f$stakeholderTypeRid,
    #stakeholderTypeNameEng: _f$stakeholderTypeNameEng,
    #stakeholderTypeNameArabic: _f$stakeholderTypeNameArabic,
    #cityRid: _f$cityRid,
    #userName: _f$userName,
    #orgIdType: _f$orgIdType,
    #orgIdNo: _f$orgIdNo,
    #orgIdExpiryDate: _f$orgIdExpiryDate,
    #orgNationality: _f$orgNationality,
    #orgMobile: _f$orgMobile,
    #licenseNo: _f$licenseNo,
    #licenseExpiryDate: _f$licenseExpiryDate,
    #isRegistrationApproved: _f$isRegistrationApproved,
    #isLicenseUser: _f$isLicenseUser,
    #userLicense: _f$userLicense,
  };
  @override
  final bool ignoreNull = true;

  static UserOrganization _instantiate(DecodingData data) {
    return UserOrganization(
      createdBy: data.dec(_f$createdBy),
      createdDate: data.dec(_f$createdDate),
      updatedBy: data.dec(_f$updatedBy),
      updatedDate: data.dec(_f$updatedDate),
      isActive: data.dec(_f$isActive),
      registrationThroughCode: data.dec(_f$registrationThroughCode),
      registrationThroughEn: data.dec(_f$registrationThroughEn),
      registrationThroughAr: data.dec(_f$registrationThroughAr),
      registrationTypeCode: data.dec(_f$registrationTypeCode),
      registrationTypeEn: data.dec(_f$registrationTypeEn),
      registrationTypeAr: data.dec(_f$registrationTypeAr),
      orgIdTypeCode: data.dec(_f$orgIdTypeCode),
      orgIdTypeEn: data.dec(_f$orgIdTypeEn),
      orgIdTypeAr: data.dec(_f$orgIdTypeAr),
      id: data.dec(_f$id),
      crn: data.dec(_f$crn),
      orgId: data.dec(_f$orgId),
      orgNameEn: data.dec(_f$orgNameEn),
      orgNameAr: data.dec(_f$orgNameAr),
      registrationThroughRid: data.dec(_f$registrationThroughRid),
      registrationTypeRid: data.dec(_f$registrationTypeRid),
      documentNumber: data.dec(_f$documentNumber),
      unitNo: data.dec(_f$unitNo),
      zipCode: data.dec(_f$zipCode),
      buildingNo: data.dec(_f$buildingNo),
      street: data.dec(_f$street),
      address: data.dec(_f$address),
      fileName: data.dec(_f$fileName),
      filePath: data.dec(_f$filePath),
      approvalStatusRid: data.dec(_f$approvalStatusRid),
      orgEmail: data.dec(_f$orgEmail),
      district: data.dec(_f$district),
      documentStatus: data.dec(_f$documentStatus),
      stakeholderTypeRid: data.dec(_f$stakeholderTypeRid),
      stakeholderTypeNameEng: data.dec(_f$stakeholderTypeNameEng),
      stakeholderTypeNameArabic: data.dec(_f$stakeholderTypeNameArabic),
      cityRid: data.dec(_f$cityRid),
      userName: data.dec(_f$userName),
      orgIdType: data.dec(_f$orgIdType),
      orgIdNo: data.dec(_f$orgIdNo),
      orgIdExpiryDate: data.dec(_f$orgIdExpiryDate),
      orgNationality: data.dec(_f$orgNationality),
      orgMobile: data.dec(_f$orgMobile),
      licenseNo: data.dec(_f$licenseNo),
      licenseExpiryDate: data.dec(_f$licenseExpiryDate),
      isRegistrationApproved: data.dec(_f$isRegistrationApproved),
      isLicenseUser: data.dec(_f$isLicenseUser),
      userLicense: data.dec(_f$userLicense),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserOrganization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserOrganization>(map);
  }

  static UserOrganization fromJson(String json) {
    return ensureInitialized().decodeJson<UserOrganization>(json);
  }
}

mixin UserOrganizationMappable {
  String toJson() {
    return UserOrganizationMapper.ensureInitialized()
        .encodeJson<UserOrganization>(this as UserOrganization);
  }

  Map<String, dynamic> toMap() {
    return UserOrganizationMapper.ensureInitialized()
        .encodeMap<UserOrganization>(this as UserOrganization);
  }

  UserOrganizationCopyWith<UserOrganization, UserOrganization, UserOrganization>
  get copyWith =>
      _UserOrganizationCopyWithImpl<UserOrganization, UserOrganization>(
        this as UserOrganization,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserOrganizationMapper.ensureInitialized().stringifyValue(
      this as UserOrganization,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserOrganizationMapper.ensureInitialized().equalsValue(
      this as UserOrganization,
      other,
    );
  }

  @override
  int get hashCode {
    return UserOrganizationMapper.ensureInitialized().hashValue(
      this as UserOrganization,
    );
  }
}

extension UserOrganizationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserOrganization, $Out> {
  UserOrganizationCopyWith<$R, UserOrganization, $Out>
  get $asUserOrganization =>
      $base.as((v, t, t2) => _UserOrganizationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserOrganizationCopyWith<$R, $In extends UserOrganization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    UserLicense,
    UserLicenseCopyWith<$R, UserLicense, UserLicense>
  >?
  get userLicense;
  $R call({
    String? createdBy,
    String? createdDate,
    String? updatedBy,
    String? updatedDate,
    bool? isActive,
    String? registrationThroughCode,
    String? registrationThroughEn,
    String? registrationThroughAr,
    String? registrationTypeCode,
    String? registrationTypeEn,
    String? registrationTypeAr,
    String? orgIdTypeCode,
    String? orgIdTypeEn,
    String? orgIdTypeAr,
    int? id,
    int? crn,
    String? orgId,
    String? orgNameEn,
    String? orgNameAr,
    int? registrationThroughRid,
    int? registrationTypeRid,
    String? documentNumber,
    String? unitNo,
    int? zipCode,
    String? buildingNo,
    String? street,
    String? address,
    String? fileName,
    String? filePath,
    int? approvalStatusRid,
    String? orgEmail,
    String? district,
    String? documentStatus,
    String? stakeholderTypeRid,
    String? stakeholderTypeNameEng,
    String? stakeholderTypeNameArabic,
    int? cityRid,
    String? userName,
    String? orgIdType,
    String? orgIdNo,
    String? orgIdExpiryDate,
    String? orgNationality,
    int? orgMobile,
    String? licenseNo,
    String? licenseExpiryDate,
    bool? isRegistrationApproved,
    bool? isLicenseUser,
    List<UserLicense>? userLicense,
  });
  UserOrganizationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserOrganizationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserOrganization, $Out>
    implements UserOrganizationCopyWith<$R, UserOrganization, $Out> {
  _UserOrganizationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserOrganization> $mapper =
      UserOrganizationMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    UserLicense,
    UserLicenseCopyWith<$R, UserLicense, UserLicense>
  >?
  get userLicense => $value.userLicense != null
      ? ListCopyWith(
          $value.userLicense!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(userLicense: v),
        )
      : null;
  @override
  $R call({
    Object? createdBy = $none,
    Object? createdDate = $none,
    Object? updatedBy = $none,
    Object? updatedDate = $none,
    Object? isActive = $none,
    Object? registrationThroughCode = $none,
    Object? registrationThroughEn = $none,
    Object? registrationThroughAr = $none,
    Object? registrationTypeCode = $none,
    Object? registrationTypeEn = $none,
    Object? registrationTypeAr = $none,
    Object? orgIdTypeCode = $none,
    Object? orgIdTypeEn = $none,
    Object? orgIdTypeAr = $none,
    Object? id = $none,
    Object? crn = $none,
    Object? orgId = $none,
    Object? orgNameEn = $none,
    Object? orgNameAr = $none,
    Object? registrationThroughRid = $none,
    Object? registrationTypeRid = $none,
    Object? documentNumber = $none,
    Object? unitNo = $none,
    Object? zipCode = $none,
    Object? buildingNo = $none,
    Object? street = $none,
    Object? address = $none,
    Object? fileName = $none,
    Object? filePath = $none,
    Object? approvalStatusRid = $none,
    Object? orgEmail = $none,
    Object? district = $none,
    Object? documentStatus = $none,
    Object? stakeholderTypeRid = $none,
    Object? stakeholderTypeNameEng = $none,
    Object? stakeholderTypeNameArabic = $none,
    Object? cityRid = $none,
    Object? userName = $none,
    Object? orgIdType = $none,
    Object? orgIdNo = $none,
    Object? orgIdExpiryDate = $none,
    Object? orgNationality = $none,
    Object? orgMobile = $none,
    Object? licenseNo = $none,
    Object? licenseExpiryDate = $none,
    Object? isRegistrationApproved = $none,
    Object? isLicenseUser = $none,
    Object? userLicense = $none,
  }) => $apply(
    FieldCopyWithData({
      if (createdBy != $none) #createdBy: createdBy,
      if (createdDate != $none) #createdDate: createdDate,
      if (updatedBy != $none) #updatedBy: updatedBy,
      if (updatedDate != $none) #updatedDate: updatedDate,
      if (isActive != $none) #isActive: isActive,
      if (registrationThroughCode != $none)
        #registrationThroughCode: registrationThroughCode,
      if (registrationThroughEn != $none)
        #registrationThroughEn: registrationThroughEn,
      if (registrationThroughAr != $none)
        #registrationThroughAr: registrationThroughAr,
      if (registrationTypeCode != $none)
        #registrationTypeCode: registrationTypeCode,
      if (registrationTypeEn != $none) #registrationTypeEn: registrationTypeEn,
      if (registrationTypeAr != $none) #registrationTypeAr: registrationTypeAr,
      if (orgIdTypeCode != $none) #orgIdTypeCode: orgIdTypeCode,
      if (orgIdTypeEn != $none) #orgIdTypeEn: orgIdTypeEn,
      if (orgIdTypeAr != $none) #orgIdTypeAr: orgIdTypeAr,
      if (id != $none) #id: id,
      if (crn != $none) #crn: crn,
      if (orgId != $none) #orgId: orgId,
      if (orgNameEn != $none) #orgNameEn: orgNameEn,
      if (orgNameAr != $none) #orgNameAr: orgNameAr,
      if (registrationThroughRid != $none)
        #registrationThroughRid: registrationThroughRid,
      if (registrationTypeRid != $none)
        #registrationTypeRid: registrationTypeRid,
      if (documentNumber != $none) #documentNumber: documentNumber,
      if (unitNo != $none) #unitNo: unitNo,
      if (zipCode != $none) #zipCode: zipCode,
      if (buildingNo != $none) #buildingNo: buildingNo,
      if (street != $none) #street: street,
      if (address != $none) #address: address,
      if (fileName != $none) #fileName: fileName,
      if (filePath != $none) #filePath: filePath,
      if (approvalStatusRid != $none) #approvalStatusRid: approvalStatusRid,
      if (orgEmail != $none) #orgEmail: orgEmail,
      if (district != $none) #district: district,
      if (documentStatus != $none) #documentStatus: documentStatus,
      if (stakeholderTypeRid != $none) #stakeholderTypeRid: stakeholderTypeRid,
      if (stakeholderTypeNameEng != $none)
        #stakeholderTypeNameEng: stakeholderTypeNameEng,
      if (stakeholderTypeNameArabic != $none)
        #stakeholderTypeNameArabic: stakeholderTypeNameArabic,
      if (cityRid != $none) #cityRid: cityRid,
      if (userName != $none) #userName: userName,
      if (orgIdType != $none) #orgIdType: orgIdType,
      if (orgIdNo != $none) #orgIdNo: orgIdNo,
      if (orgIdExpiryDate != $none) #orgIdExpiryDate: orgIdExpiryDate,
      if (orgNationality != $none) #orgNationality: orgNationality,
      if (orgMobile != $none) #orgMobile: orgMobile,
      if (licenseNo != $none) #licenseNo: licenseNo,
      if (licenseExpiryDate != $none) #licenseExpiryDate: licenseExpiryDate,
      if (isRegistrationApproved != $none)
        #isRegistrationApproved: isRegistrationApproved,
      if (isLicenseUser != $none) #isLicenseUser: isLicenseUser,
      if (userLicense != $none) #userLicense: userLicense,
    }),
  );
  @override
  UserOrganization $make(CopyWithData data) => UserOrganization(
    createdBy: data.get(#createdBy, or: $value.createdBy),
    createdDate: data.get(#createdDate, or: $value.createdDate),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
    updatedDate: data.get(#updatedDate, or: $value.updatedDate),
    isActive: data.get(#isActive, or: $value.isActive),
    registrationThroughCode: data.get(
      #registrationThroughCode,
      or: $value.registrationThroughCode,
    ),
    registrationThroughEn: data.get(
      #registrationThroughEn,
      or: $value.registrationThroughEn,
    ),
    registrationThroughAr: data.get(
      #registrationThroughAr,
      or: $value.registrationThroughAr,
    ),
    registrationTypeCode: data.get(
      #registrationTypeCode,
      or: $value.registrationTypeCode,
    ),
    registrationTypeEn: data.get(
      #registrationTypeEn,
      or: $value.registrationTypeEn,
    ),
    registrationTypeAr: data.get(
      #registrationTypeAr,
      or: $value.registrationTypeAr,
    ),
    orgIdTypeCode: data.get(#orgIdTypeCode, or: $value.orgIdTypeCode),
    orgIdTypeEn: data.get(#orgIdTypeEn, or: $value.orgIdTypeEn),
    orgIdTypeAr: data.get(#orgIdTypeAr, or: $value.orgIdTypeAr),
    id: data.get(#id, or: $value.id),
    crn: data.get(#crn, or: $value.crn),
    orgId: data.get(#orgId, or: $value.orgId),
    orgNameEn: data.get(#orgNameEn, or: $value.orgNameEn),
    orgNameAr: data.get(#orgNameAr, or: $value.orgNameAr),
    registrationThroughRid: data.get(
      #registrationThroughRid,
      or: $value.registrationThroughRid,
    ),
    registrationTypeRid: data.get(
      #registrationTypeRid,
      or: $value.registrationTypeRid,
    ),
    documentNumber: data.get(#documentNumber, or: $value.documentNumber),
    unitNo: data.get(#unitNo, or: $value.unitNo),
    zipCode: data.get(#zipCode, or: $value.zipCode),
    buildingNo: data.get(#buildingNo, or: $value.buildingNo),
    street: data.get(#street, or: $value.street),
    address: data.get(#address, or: $value.address),
    fileName: data.get(#fileName, or: $value.fileName),
    filePath: data.get(#filePath, or: $value.filePath),
    approvalStatusRid: data.get(
      #approvalStatusRid,
      or: $value.approvalStatusRid,
    ),
    orgEmail: data.get(#orgEmail, or: $value.orgEmail),
    district: data.get(#district, or: $value.district),
    documentStatus: data.get(#documentStatus, or: $value.documentStatus),
    stakeholderTypeRid: data.get(
      #stakeholderTypeRid,
      or: $value.stakeholderTypeRid,
    ),
    stakeholderTypeNameEng: data.get(
      #stakeholderTypeNameEng,
      or: $value.stakeholderTypeNameEng,
    ),
    stakeholderTypeNameArabic: data.get(
      #stakeholderTypeNameArabic,
      or: $value.stakeholderTypeNameArabic,
    ),
    cityRid: data.get(#cityRid, or: $value.cityRid),
    userName: data.get(#userName, or: $value.userName),
    orgIdType: data.get(#orgIdType, or: $value.orgIdType),
    orgIdNo: data.get(#orgIdNo, or: $value.orgIdNo),
    orgIdExpiryDate: data.get(#orgIdExpiryDate, or: $value.orgIdExpiryDate),
    orgNationality: data.get(#orgNationality, or: $value.orgNationality),
    orgMobile: data.get(#orgMobile, or: $value.orgMobile),
    licenseNo: data.get(#licenseNo, or: $value.licenseNo),
    licenseExpiryDate: data.get(
      #licenseExpiryDate,
      or: $value.licenseExpiryDate,
    ),
    isRegistrationApproved: data.get(
      #isRegistrationApproved,
      or: $value.isRegistrationApproved,
    ),
    isLicenseUser: data.get(#isLicenseUser, or: $value.isLicenseUser),
    userLicense: data.get(#userLicense, or: $value.userLicense),
  );

  @override
  UserOrganizationCopyWith<$R2, UserOrganization, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserOrganizationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserLicenseMapper extends ClassMapperBase<UserLicense> {
  UserLicenseMapper._();

  static UserLicenseMapper? _instance;
  static UserLicenseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserLicenseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserLicense';

  static int? _$id(UserLicense v) => v.id;
  static const Field<UserLicense, int> _f$id = Field('id', _$id, opt: true);
  static int? _$userOrgId(UserLicense v) => v.userOrgId;
  static const Field<UserLicense, int> _f$userOrgId = Field(
    'userOrgId',
    _$userOrgId,
    opt: true,
  );
  static String? _$orgId(UserLicense v) => v.orgId;
  static const Field<UserLicense, String> _f$orgId = Field(
    'orgId',
    _$orgId,
    opt: true,
  );
  static String? _$orgName(UserLicense v) => v.orgName;
  static const Field<UserLicense, String> _f$orgName = Field(
    'orgName',
    _$orgName,
    opt: true,
  );
  static String? _$stakeholderTypeRid(UserLicense v) => v.stakeholderTypeRid;
  static const Field<UserLicense, String> _f$stakeholderTypeRid = Field(
    'stakeholderTypeRid',
    _$stakeholderTypeRid,
    opt: true,
  );
  static int? _$crn(UserLicense v) => v.crn;
  static const Field<UserLicense, int> _f$crn = Field('crn', _$crn, opt: true);
  static String? _$licenseTypeRid(UserLicense v) => v.licenseTypeRid;
  static const Field<UserLicense, String> _f$licenseTypeRid = Field(
    'licenseTypeRid',
    _$licenseTypeRid,
    opt: true,
  );
  static String? _$investorTypeRid(UserLicense v) => v.investorTypeRid;
  static const Field<UserLicense, String> _f$investorTypeRid = Field(
    'investorTypeRid',
    _$investorTypeRid,
    opt: true,
  );
  static int? _$eunn(UserLicense v) => v.eunn;
  static const Field<UserLicense, int> _f$eunn = Field(
    'eunn',
    _$eunn,
    opt: true,
  );
  static String? _$establishmentName(UserLicense v) => v.establishmentName;
  static const Field<UserLicense, String> _f$establishmentName = Field(
    'establishmentName',
    _$establishmentName,
    opt: true,
  );
  static String? _$establishmentType(UserLicense v) => v.establishmentType;
  static const Field<UserLicense, String> _f$establishmentType = Field(
    'establishmentType',
    _$establishmentType,
    opt: true,
  );
  static String? _$establishmentActivity(UserLicense v) =>
      v.establishmentActivity;
  static const Field<UserLicense, String> _f$establishmentActivity = Field(
    'establishmentActivity',
    _$establishmentActivity,
    opt: true,
  );
  static String? _$establishmentStatus(UserLicense v) => v.establishmentStatus;
  static const Field<UserLicense, String> _f$establishmentStatus = Field(
    'establishmentStatus',
    _$establishmentStatus,
    opt: true,
  );
  static String? _$establishmentIssueDate(UserLicense v) =>
      v.establishmentIssueDate;
  static const Field<UserLicense, String> _f$establishmentIssueDate = Field(
    'establishmentIssueDate',
    _$establishmentIssueDate,
    opt: true,
  );
  static String? _$establishmentExpiryDate(UserLicense v) =>
      v.establishmentExpiryDate;
  static const Field<UserLicense, String> _f$establishmentExpiryDate = Field(
    'establishmentExpiryDate',
    _$establishmentExpiryDate,
    opt: true,
  );
  static String? _$establishmentCity(UserLicense v) => v.establishmentCity;
  static const Field<UserLicense, String> _f$establishmentCity = Field(
    'establishmentCity',
    _$establishmentCity,
    opt: true,
  );
  static String? _$recordType(UserLicense v) => v.recordType;
  static const Field<UserLicense, String> _f$recordType = Field(
    'recordType',
    _$recordType,
    opt: true,
  );
  static String? _$address(UserLicense v) => v.address;
  static const Field<UserLicense, String> _f$address = Field(
    'address',
    _$address,
    opt: true,
  );
  static String? _$mailbox(UserLicense v) => v.mailbox;
  static const Field<UserLicense, String> _f$mailbox = Field(
    'mailbox',
    _$mailbox,
    opt: true,
  );
  static String? _$managerName(UserLicense v) => v.managerName;
  static const Field<UserLicense, String> _f$managerName = Field(
    'managerName',
    _$managerName,
    opt: true,
  );
  static String? _$managerNationality(UserLicense v) => v.managerNationality;
  static const Field<UserLicense, String> _f$managerNationality = Field(
    'managerNationality',
    _$managerNationality,
    opt: true,
  );
  static String? _$listOfPartners(UserLicense v) => v.listOfPartners;
  static const Field<UserLicense, String> _f$listOfPartners = Field(
    'listOfPartners',
    _$listOfPartners,
    opt: true,
  );
  static String? _$sadadNo(UserLicense v) => v.sadadNo;
  static const Field<UserLicense, String> _f$sadadNo = Field(
    'sadadNo',
    _$sadadNo,
    opt: true,
  );
  static String? _$licenseNumber(UserLicense v) => v.licenseNumber;
  static const Field<UserLicense, String> _f$licenseNumber = Field(
    'licenseNumber',
    _$licenseNumber,
    opt: true,
  );
  static String? _$licenseExpiryDate(UserLicense v) => v.licenseExpiryDate;
  static const Field<UserLicense, String> _f$licenseExpiryDate = Field(
    'licenseExpiryDate',
    _$licenseExpiryDate,
    opt: true,
  );
  static int? _$licenseStatusRid(UserLicense v) => v.licenseStatusRid;
  static const Field<UserLicense, int> _f$licenseStatusRid = Field(
    'licenseStatusRid',
    _$licenseStatusRid,
    opt: true,
  );
  static int? _$requestTypeRid(UserLicense v) => v.requestTypeRid;
  static const Field<UserLicense, int> _f$requestTypeRid = Field(
    'requestTypeRid',
    _$requestTypeRid,
    opt: true,
  );
  static int? _$approvalStatusRid(UserLicense v) => v.approvalStatusRid;
  static const Field<UserLicense, int> _f$approvalStatusRid = Field(
    'approvalStatusRid',
    _$approvalStatusRid,
    opt: true,
  );
  static String? _$fileName(UserLicense v) => v.fileName;
  static const Field<UserLicense, String> _f$fileName = Field(
    'fileName',
    _$fileName,
    opt: true,
  );
  static String? _$filePath(UserLicense v) => v.filePath;
  static const Field<UserLicense, String> _f$filePath = Field(
    'filePath',
    _$filePath,
    opt: true,
  );
  static String? _$suspensionTo(UserLicense v) => v.suspensionTo;
  static const Field<UserLicense, String> _f$suspensionTo = Field(
    'suspensionTo',
    _$suspensionTo,
    opt: true,
  );
  static int? _$idNumber(UserLicense v) => v.idNumber;
  static const Field<UserLicense, int> _f$idNumber = Field(
    'idNumber',
    _$idNumber,
    opt: true,
  );

  @override
  final MappableFields<UserLicense> fields = const {
    #id: _f$id,
    #userOrgId: _f$userOrgId,
    #orgId: _f$orgId,
    #orgName: _f$orgName,
    #stakeholderTypeRid: _f$stakeholderTypeRid,
    #crn: _f$crn,
    #licenseTypeRid: _f$licenseTypeRid,
    #investorTypeRid: _f$investorTypeRid,
    #eunn: _f$eunn,
    #establishmentName: _f$establishmentName,
    #establishmentType: _f$establishmentType,
    #establishmentActivity: _f$establishmentActivity,
    #establishmentStatus: _f$establishmentStatus,
    #establishmentIssueDate: _f$establishmentIssueDate,
    #establishmentExpiryDate: _f$establishmentExpiryDate,
    #establishmentCity: _f$establishmentCity,
    #recordType: _f$recordType,
    #address: _f$address,
    #mailbox: _f$mailbox,
    #managerName: _f$managerName,
    #managerNationality: _f$managerNationality,
    #listOfPartners: _f$listOfPartners,
    #sadadNo: _f$sadadNo,
    #licenseNumber: _f$licenseNumber,
    #licenseExpiryDate: _f$licenseExpiryDate,
    #licenseStatusRid: _f$licenseStatusRid,
    #requestTypeRid: _f$requestTypeRid,
    #approvalStatusRid: _f$approvalStatusRid,
    #fileName: _f$fileName,
    #filePath: _f$filePath,
    #suspensionTo: _f$suspensionTo,
    #idNumber: _f$idNumber,
  };
  @override
  final bool ignoreNull = true;

  static UserLicense _instantiate(DecodingData data) {
    return UserLicense(
      id: data.dec(_f$id),
      userOrgId: data.dec(_f$userOrgId),
      orgId: data.dec(_f$orgId),
      orgName: data.dec(_f$orgName),
      stakeholderTypeRid: data.dec(_f$stakeholderTypeRid),
      crn: data.dec(_f$crn),
      licenseTypeRid: data.dec(_f$licenseTypeRid),
      investorTypeRid: data.dec(_f$investorTypeRid),
      eunn: data.dec(_f$eunn),
      establishmentName: data.dec(_f$establishmentName),
      establishmentType: data.dec(_f$establishmentType),
      establishmentActivity: data.dec(_f$establishmentActivity),
      establishmentStatus: data.dec(_f$establishmentStatus),
      establishmentIssueDate: data.dec(_f$establishmentIssueDate),
      establishmentExpiryDate: data.dec(_f$establishmentExpiryDate),
      establishmentCity: data.dec(_f$establishmentCity),
      recordType: data.dec(_f$recordType),
      address: data.dec(_f$address),
      mailbox: data.dec(_f$mailbox),
      managerName: data.dec(_f$managerName),
      managerNationality: data.dec(_f$managerNationality),
      listOfPartners: data.dec(_f$listOfPartners),
      sadadNo: data.dec(_f$sadadNo),
      licenseNumber: data.dec(_f$licenseNumber),
      licenseExpiryDate: data.dec(_f$licenseExpiryDate),
      licenseStatusRid: data.dec(_f$licenseStatusRid),
      requestTypeRid: data.dec(_f$requestTypeRid),
      approvalStatusRid: data.dec(_f$approvalStatusRid),
      fileName: data.dec(_f$fileName),
      filePath: data.dec(_f$filePath),
      suspensionTo: data.dec(_f$suspensionTo),
      idNumber: data.dec(_f$idNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserLicense fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserLicense>(map);
  }

  static UserLicense fromJson(String json) {
    return ensureInitialized().decodeJson<UserLicense>(json);
  }
}

mixin UserLicenseMappable {
  String toJson() {
    return UserLicenseMapper.ensureInitialized().encodeJson<UserLicense>(
      this as UserLicense,
    );
  }

  Map<String, dynamic> toMap() {
    return UserLicenseMapper.ensureInitialized().encodeMap<UserLicense>(
      this as UserLicense,
    );
  }

  UserLicenseCopyWith<UserLicense, UserLicense, UserLicense> get copyWith =>
      _UserLicenseCopyWithImpl<UserLicense, UserLicense>(
        this as UserLicense,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserLicenseMapper.ensureInitialized().stringifyValue(
      this as UserLicense,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserLicenseMapper.ensureInitialized().equalsValue(
      this as UserLicense,
      other,
    );
  }

  @override
  int get hashCode {
    return UserLicenseMapper.ensureInitialized().hashValue(this as UserLicense);
  }
}

extension UserLicenseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserLicense, $Out> {
  UserLicenseCopyWith<$R, UserLicense, $Out> get $asUserLicense =>
      $base.as((v, t, t2) => _UserLicenseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserLicenseCopyWith<$R, $In extends UserLicense, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    int? userOrgId,
    String? orgId,
    String? orgName,
    String? stakeholderTypeRid,
    int? crn,
    String? licenseTypeRid,
    String? investorTypeRid,
    int? eunn,
    String? establishmentName,
    String? establishmentType,
    String? establishmentActivity,
    String? establishmentStatus,
    String? establishmentIssueDate,
    String? establishmentExpiryDate,
    String? establishmentCity,
    String? recordType,
    String? address,
    String? mailbox,
    String? managerName,
    String? managerNationality,
    String? listOfPartners,
    String? sadadNo,
    String? licenseNumber,
    String? licenseExpiryDate,
    int? licenseStatusRid,
    int? requestTypeRid,
    int? approvalStatusRid,
    String? fileName,
    String? filePath,
    String? suspensionTo,
    int? idNumber,
  });
  UserLicenseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserLicenseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserLicense, $Out>
    implements UserLicenseCopyWith<$R, UserLicense, $Out> {
  _UserLicenseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserLicense> $mapper =
      UserLicenseMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? userOrgId = $none,
    Object? orgId = $none,
    Object? orgName = $none,
    Object? stakeholderTypeRid = $none,
    Object? crn = $none,
    Object? licenseTypeRid = $none,
    Object? investorTypeRid = $none,
    Object? eunn = $none,
    Object? establishmentName = $none,
    Object? establishmentType = $none,
    Object? establishmentActivity = $none,
    Object? establishmentStatus = $none,
    Object? establishmentIssueDate = $none,
    Object? establishmentExpiryDate = $none,
    Object? establishmentCity = $none,
    Object? recordType = $none,
    Object? address = $none,
    Object? mailbox = $none,
    Object? managerName = $none,
    Object? managerNationality = $none,
    Object? listOfPartners = $none,
    Object? sadadNo = $none,
    Object? licenseNumber = $none,
    Object? licenseExpiryDate = $none,
    Object? licenseStatusRid = $none,
    Object? requestTypeRid = $none,
    Object? approvalStatusRid = $none,
    Object? fileName = $none,
    Object? filePath = $none,
    Object? suspensionTo = $none,
    Object? idNumber = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (userOrgId != $none) #userOrgId: userOrgId,
      if (orgId != $none) #orgId: orgId,
      if (orgName != $none) #orgName: orgName,
      if (stakeholderTypeRid != $none) #stakeholderTypeRid: stakeholderTypeRid,
      if (crn != $none) #crn: crn,
      if (licenseTypeRid != $none) #licenseTypeRid: licenseTypeRid,
      if (investorTypeRid != $none) #investorTypeRid: investorTypeRid,
      if (eunn != $none) #eunn: eunn,
      if (establishmentName != $none) #establishmentName: establishmentName,
      if (establishmentType != $none) #establishmentType: establishmentType,
      if (establishmentActivity != $none)
        #establishmentActivity: establishmentActivity,
      if (establishmentStatus != $none)
        #establishmentStatus: establishmentStatus,
      if (establishmentIssueDate != $none)
        #establishmentIssueDate: establishmentIssueDate,
      if (establishmentExpiryDate != $none)
        #establishmentExpiryDate: establishmentExpiryDate,
      if (establishmentCity != $none) #establishmentCity: establishmentCity,
      if (recordType != $none) #recordType: recordType,
      if (address != $none) #address: address,
      if (mailbox != $none) #mailbox: mailbox,
      if (managerName != $none) #managerName: managerName,
      if (managerNationality != $none) #managerNationality: managerNationality,
      if (listOfPartners != $none) #listOfPartners: listOfPartners,
      if (sadadNo != $none) #sadadNo: sadadNo,
      if (licenseNumber != $none) #licenseNumber: licenseNumber,
      if (licenseExpiryDate != $none) #licenseExpiryDate: licenseExpiryDate,
      if (licenseStatusRid != $none) #licenseStatusRid: licenseStatusRid,
      if (requestTypeRid != $none) #requestTypeRid: requestTypeRid,
      if (approvalStatusRid != $none) #approvalStatusRid: approvalStatusRid,
      if (fileName != $none) #fileName: fileName,
      if (filePath != $none) #filePath: filePath,
      if (suspensionTo != $none) #suspensionTo: suspensionTo,
      if (idNumber != $none) #idNumber: idNumber,
    }),
  );
  @override
  UserLicense $make(CopyWithData data) => UserLicense(
    id: data.get(#id, or: $value.id),
    userOrgId: data.get(#userOrgId, or: $value.userOrgId),
    orgId: data.get(#orgId, or: $value.orgId),
    orgName: data.get(#orgName, or: $value.orgName),
    stakeholderTypeRid: data.get(
      #stakeholderTypeRid,
      or: $value.stakeholderTypeRid,
    ),
    crn: data.get(#crn, or: $value.crn),
    licenseTypeRid: data.get(#licenseTypeRid, or: $value.licenseTypeRid),
    investorTypeRid: data.get(#investorTypeRid, or: $value.investorTypeRid),
    eunn: data.get(#eunn, or: $value.eunn),
    establishmentName: data.get(
      #establishmentName,
      or: $value.establishmentName,
    ),
    establishmentType: data.get(
      #establishmentType,
      or: $value.establishmentType,
    ),
    establishmentActivity: data.get(
      #establishmentActivity,
      or: $value.establishmentActivity,
    ),
    establishmentStatus: data.get(
      #establishmentStatus,
      or: $value.establishmentStatus,
    ),
    establishmentIssueDate: data.get(
      #establishmentIssueDate,
      or: $value.establishmentIssueDate,
    ),
    establishmentExpiryDate: data.get(
      #establishmentExpiryDate,
      or: $value.establishmentExpiryDate,
    ),
    establishmentCity: data.get(
      #establishmentCity,
      or: $value.establishmentCity,
    ),
    recordType: data.get(#recordType, or: $value.recordType),
    address: data.get(#address, or: $value.address),
    mailbox: data.get(#mailbox, or: $value.mailbox),
    managerName: data.get(#managerName, or: $value.managerName),
    managerNationality: data.get(
      #managerNationality,
      or: $value.managerNationality,
    ),
    listOfPartners: data.get(#listOfPartners, or: $value.listOfPartners),
    sadadNo: data.get(#sadadNo, or: $value.sadadNo),
    licenseNumber: data.get(#licenseNumber, or: $value.licenseNumber),
    licenseExpiryDate: data.get(
      #licenseExpiryDate,
      or: $value.licenseExpiryDate,
    ),
    licenseStatusRid: data.get(#licenseStatusRid, or: $value.licenseStatusRid),
    requestTypeRid: data.get(#requestTypeRid, or: $value.requestTypeRid),
    approvalStatusRid: data.get(
      #approvalStatusRid,
      or: $value.approvalStatusRid,
    ),
    fileName: data.get(#fileName, or: $value.fileName),
    filePath: data.get(#filePath, or: $value.filePath),
    suspensionTo: data.get(#suspensionTo, or: $value.suspensionTo),
    idNumber: data.get(#idNumber, or: $value.idNumber),
  );

  @override
  UserLicenseCopyWith<$R2, UserLicense, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserLicenseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserBranchMapper extends ClassMapperBase<UserBranch> {
  UserBranchMapper._();

  static UserBranchMapper? _instance;
  static UserBranchMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserBranchMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserBranch';

  static int? _$id(UserBranch v) => v.id;
  static const Field<UserBranch, int> _f$id = Field('id', _$id, opt: true);
  static String? _$branchId(UserBranch v) => v.branchId;
  static const Field<UserBranch, String> _f$branchId = Field(
    'branchId',
    _$branchId,
    opt: true,
  );
  static int? _$orgId(UserBranch v) => v.orgId;
  static const Field<UserBranch, int> _f$orgId = Field(
    'orgId',
    _$orgId,
    opt: true,
  );
  static String? _$branchName(UserBranch v) => v.branchName;
  static const Field<UserBranch, String> _f$branchName = Field(
    'branchName',
    _$branchName,
    opt: true,
  );
  static String? _$locationRid(UserBranch v) => v.locationRid;
  static const Field<UserBranch, String> _f$locationRid = Field(
    'locationRid',
    _$locationRid,
    opt: true,
  );
  static int? _$portRid(UserBranch v) => v.portRid;
  static const Field<UserBranch, int> _f$portRid = Field(
    'portRid',
    _$portRid,
    opt: true,
  );
  static String? _$createdBy(UserBranch v) => v.createdBy;
  static const Field<UserBranch, String> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    opt: true,
  );
  static String? _$createdDate(UserBranch v) => v.createdDate;
  static const Field<UserBranch, String> _f$createdDate = Field(
    'createdDate',
    _$createdDate,
    opt: true,
  );
  static String? _$updatedBy(UserBranch v) => v.updatedBy;
  static const Field<UserBranch, String> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    opt: true,
  );
  static String? _$updatedDate(UserBranch v) => v.updatedDate;
  static const Field<UserBranch, String> _f$updatedDate = Field(
    'updatedDate',
    _$updatedDate,
    opt: true,
  );
  static bool? _$isActive(UserBranch v) => v.isActive;
  static const Field<UserBranch, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
  );
  static String? _$portNameEnglish(UserBranch v) => v.portNameEnglish;
  static const Field<UserBranch, String> _f$portNameEnglish = Field(
    'portNameEnglish',
    _$portNameEnglish,
    opt: true,
  );
  static String? _$portNameArabic(UserBranch v) => v.portNameArabic;
  static const Field<UserBranch, String> _f$portNameArabic = Field(
    'portNameArabic',
    _$portNameArabic,
    opt: true,
  );
  static String? _$locationNameEnglish(UserBranch v) => v.locationNameEnglish;
  static const Field<UserBranch, String> _f$locationNameEnglish = Field(
    'locationNameEnglish',
    _$locationNameEnglish,
    opt: true,
  );
  static String? _$locationNameArabic(UserBranch v) => v.locationNameArabic;
  static const Field<UserBranch, String> _f$locationNameArabic = Field(
    'locationNameArabic',
    _$locationNameArabic,
    opt: true,
  );

  @override
  final MappableFields<UserBranch> fields = const {
    #id: _f$id,
    #branchId: _f$branchId,
    #orgId: _f$orgId,
    #branchName: _f$branchName,
    #locationRid: _f$locationRid,
    #portRid: _f$portRid,
    #createdBy: _f$createdBy,
    #createdDate: _f$createdDate,
    #updatedBy: _f$updatedBy,
    #updatedDate: _f$updatedDate,
    #isActive: _f$isActive,
    #portNameEnglish: _f$portNameEnglish,
    #portNameArabic: _f$portNameArabic,
    #locationNameEnglish: _f$locationNameEnglish,
    #locationNameArabic: _f$locationNameArabic,
  };
  @override
  final bool ignoreNull = true;

  static UserBranch _instantiate(DecodingData data) {
    return UserBranch(
      id: data.dec(_f$id),
      branchId: data.dec(_f$branchId),
      orgId: data.dec(_f$orgId),
      branchName: data.dec(_f$branchName),
      locationRid: data.dec(_f$locationRid),
      portRid: data.dec(_f$portRid),
      createdBy: data.dec(_f$createdBy),
      createdDate: data.dec(_f$createdDate),
      updatedBy: data.dec(_f$updatedBy),
      updatedDate: data.dec(_f$updatedDate),
      isActive: data.dec(_f$isActive),
      portNameEnglish: data.dec(_f$portNameEnglish),
      portNameArabic: data.dec(_f$portNameArabic),
      locationNameEnglish: data.dec(_f$locationNameEnglish),
      locationNameArabic: data.dec(_f$locationNameArabic),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserBranch fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserBranch>(map);
  }

  static UserBranch fromJson(String json) {
    return ensureInitialized().decodeJson<UserBranch>(json);
  }
}

mixin UserBranchMappable {
  String toJson() {
    return UserBranchMapper.ensureInitialized().encodeJson<UserBranch>(
      this as UserBranch,
    );
  }

  Map<String, dynamic> toMap() {
    return UserBranchMapper.ensureInitialized().encodeMap<UserBranch>(
      this as UserBranch,
    );
  }

  UserBranchCopyWith<UserBranch, UserBranch, UserBranch> get copyWith =>
      _UserBranchCopyWithImpl<UserBranch, UserBranch>(
        this as UserBranch,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserBranchMapper.ensureInitialized().stringifyValue(
      this as UserBranch,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserBranchMapper.ensureInitialized().equalsValue(
      this as UserBranch,
      other,
    );
  }

  @override
  int get hashCode {
    return UserBranchMapper.ensureInitialized().hashValue(this as UserBranch);
  }
}

extension UserBranchValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserBranch, $Out> {
  UserBranchCopyWith<$R, UserBranch, $Out> get $asUserBranch =>
      $base.as((v, t, t2) => _UserBranchCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserBranchCopyWith<$R, $In extends UserBranch, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? branchId,
    int? orgId,
    String? branchName,
    String? locationRid,
    int? portRid,
    String? createdBy,
    String? createdDate,
    String? updatedBy,
    String? updatedDate,
    bool? isActive,
    String? portNameEnglish,
    String? portNameArabic,
    String? locationNameEnglish,
    String? locationNameArabic,
  });
  UserBranchCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserBranchCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserBranch, $Out>
    implements UserBranchCopyWith<$R, UserBranch, $Out> {
  _UserBranchCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserBranch> $mapper =
      UserBranchMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? branchId = $none,
    Object? orgId = $none,
    Object? branchName = $none,
    Object? locationRid = $none,
    Object? portRid = $none,
    Object? createdBy = $none,
    Object? createdDate = $none,
    Object? updatedBy = $none,
    Object? updatedDate = $none,
    Object? isActive = $none,
    Object? portNameEnglish = $none,
    Object? portNameArabic = $none,
    Object? locationNameEnglish = $none,
    Object? locationNameArabic = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (branchId != $none) #branchId: branchId,
      if (orgId != $none) #orgId: orgId,
      if (branchName != $none) #branchName: branchName,
      if (locationRid != $none) #locationRid: locationRid,
      if (portRid != $none) #portRid: portRid,
      if (createdBy != $none) #createdBy: createdBy,
      if (createdDate != $none) #createdDate: createdDate,
      if (updatedBy != $none) #updatedBy: updatedBy,
      if (updatedDate != $none) #updatedDate: updatedDate,
      if (isActive != $none) #isActive: isActive,
      if (portNameEnglish != $none) #portNameEnglish: portNameEnglish,
      if (portNameArabic != $none) #portNameArabic: portNameArabic,
      if (locationNameEnglish != $none)
        #locationNameEnglish: locationNameEnglish,
      if (locationNameArabic != $none) #locationNameArabic: locationNameArabic,
    }),
  );
  @override
  UserBranch $make(CopyWithData data) => UserBranch(
    id: data.get(#id, or: $value.id),
    branchId: data.get(#branchId, or: $value.branchId),
    orgId: data.get(#orgId, or: $value.orgId),
    branchName: data.get(#branchName, or: $value.branchName),
    locationRid: data.get(#locationRid, or: $value.locationRid),
    portRid: data.get(#portRid, or: $value.portRid),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    createdDate: data.get(#createdDate, or: $value.createdDate),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
    updatedDate: data.get(#updatedDate, or: $value.updatedDate),
    isActive: data.get(#isActive, or: $value.isActive),
    portNameEnglish: data.get(#portNameEnglish, or: $value.portNameEnglish),
    portNameArabic: data.get(#portNameArabic, or: $value.portNameArabic),
    locationNameEnglish: data.get(
      #locationNameEnglish,
      or: $value.locationNameEnglish,
    ),
    locationNameArabic: data.get(
      #locationNameArabic,
      or: $value.locationNameArabic,
    ),
  );

  @override
  UserBranchCopyWith<$R2, UserBranch, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserBranchCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserAccessListMapper extends ClassMapperBase<UserAccessList> {
  UserAccessListMapper._();

  static UserAccessListMapper? _instance;
  static UserAccessListMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserAccessListMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserAccessList';

  static String? _$headId(UserAccessList v) => v.headId;
  static const Field<UserAccessList, String> _f$headId = Field(
    'headId',
    _$headId,
    opt: true,
  );
  static String? _$header(UserAccessList v) => v.header;
  static const Field<UserAccessList, String> _f$header = Field(
    'header',
    _$header,
    opt: true,
  );
  static String? _$headerAr(UserAccessList v) => v.headerAr;
  static const Field<UserAccessList, String> _f$headerAr = Field(
    'headerAr',
    _$headerAr,
    opt: true,
  );
  static String? _$headerDescription(UserAccessList v) => v.headerDescription;
  static const Field<UserAccessList, String> _f$headerDescription = Field(
    'headerDescription',
    _$headerDescription,
    opt: true,
  );
  static String? _$headerIconPath(UserAccessList v) => v.headerIconPath;
  static const Field<UserAccessList, String> _f$headerIconPath = Field(
    'headerIconPath',
    _$headerIconPath,
    opt: true,
  );
  static String? _$headSequenceNo(UserAccessList v) => v.headSequenceNo;
  static const Field<UserAccessList, String> _f$headSequenceNo = Field(
    'headSequenceNo',
    _$headSequenceNo,
    opt: true,
  );
  static String? _$moduleId(UserAccessList v) => v.moduleId;
  static const Field<UserAccessList, String> _f$moduleId = Field(
    'moduleId',
    _$moduleId,
    opt: true,
  );
  static String? _$module(UserAccessList v) => v.module;
  static const Field<UserAccessList, String> _f$module = Field(
    'module',
    _$module,
    opt: true,
  );
  static String? _$moduleDescription(UserAccessList v) => v.moduleDescription;
  static const Field<UserAccessList, String> _f$moduleDescription = Field(
    'moduleDescription',
    _$moduleDescription,
    opt: true,
  );
  static String? _$moduleIconPath(UserAccessList v) => v.moduleIconPath;
  static const Field<UserAccessList, String> _f$moduleIconPath = Field(
    'moduleIconPath',
    _$moduleIconPath,
    opt: true,
  );
  static String? _$moduleRoute(UserAccessList v) => v.moduleRoute;
  static const Field<UserAccessList, String> _f$moduleRoute = Field(
    'moduleRoute',
    _$moduleRoute,
    opt: true,
  );
  static String? _$pageId(UserAccessList v) => v.pageId;
  static const Field<UserAccessList, String> _f$pageId = Field(
    'pageId',
    _$pageId,
    opt: true,
  );
  static String? _$mawaniMenuSetting(UserAccessList v) => v.mawaniMenuSetting;
  static const Field<UserAccessList, String> _f$mawaniMenuSetting = Field(
    'mawaniMenuSetting',
    _$mawaniMenuSetting,
    opt: true,
  );
  static String? _$page(UserAccessList v) => v.page;
  static const Field<UserAccessList, String> _f$page = Field(
    'page',
    _$page,
    opt: true,
  );
  static String? _$pageArabic(UserAccessList v) => v.pageArabic;
  static const Field<UserAccessList, String> _f$pageArabic = Field(
    'pageArabic',
    _$pageArabic,
    opt: true,
  );
  static String? _$pageCode(UserAccessList v) => v.pageCode;
  static const Field<UserAccessList, String> _f$pageCode = Field(
    'pageCode',
    _$pageCode,
    opt: true,
  );
  static String? _$pageDescription(UserAccessList v) => v.pageDescription;
  static const Field<UserAccessList, String> _f$pageDescription = Field(
    'pageDescription',
    _$pageDescription,
    opt: true,
  );
  static String? _$pageDescriptionArabic(UserAccessList v) =>
      v.pageDescriptionArabic;
  static const Field<UserAccessList, String> _f$pageDescriptionArabic = Field(
    'pageDescriptionArabic',
    _$pageDescriptionArabic,
    opt: true,
  );
  static String? _$pageIconPath(UserAccessList v) => v.pageIconPath;
  static const Field<UserAccessList, String> _f$pageIconPath = Field(
    'pageIconPath',
    _$pageIconPath,
    opt: true,
  );
  static String? _$pageRoute(UserAccessList v) => v.pageRoute;
  static const Field<UserAccessList, String> _f$pageRoute = Field(
    'pageRoute',
    _$pageRoute,
    opt: true,
  );
  static String? _$pageSequence(UserAccessList v) => v.pageSequence;
  static const Field<UserAccessList, String> _f$pageSequence = Field(
    'pageSequence',
    _$pageSequence,
    opt: true,
  );
  static String? _$stakeholderCategoryRid(UserAccessList v) =>
      v.stakeholderCategoryRid;
  static const Field<UserAccessList, String> _f$stakeholderCategoryRid = Field(
    'stakeholderCategoryRid',
    _$stakeholderCategoryRid,
    opt: true,
  );
  static String? _$stakeholderTypeId(UserAccessList v) => v.stakeholderTypeId;
  static const Field<UserAccessList, String> _f$stakeholderTypeId = Field(
    'stakeholderTypeId',
    _$stakeholderTypeId,
    opt: true,
  );
  static String? _$appId(UserAccessList v) => v.appId;
  static const Field<UserAccessList, String> _f$appId = Field(
    'appId',
    _$appId,
    opt: true,
  );
  static String? _$stakeHolderId(UserAccessList v) => v.stakeHolderId;
  static const Field<UserAccessList, String> _f$stakeHolderId = Field(
    'stakeHolderId',
    _$stakeHolderId,
    opt: true,
  );
  static String? _$accessPageId(UserAccessList v) => v.accessPageId;
  static const Field<UserAccessList, String> _f$accessPageId = Field(
    'accessPageId',
    _$accessPageId,
    opt: true,
  );
  static bool _$accessView(UserAccessList v) => v.accessView;
  static const Field<UserAccessList, bool> _f$accessView = Field(
    'accessView',
    _$accessView,
    opt: true,
    def: false,
  );
  static bool _$accessCreate(UserAccessList v) => v.accessCreate;
  static const Field<UserAccessList, bool> _f$accessCreate = Field(
    'accessCreate',
    _$accessCreate,
    opt: true,
    def: false,
  );
  static bool _$accessEdit(UserAccessList v) => v.accessEdit;
  static const Field<UserAccessList, bool> _f$accessEdit = Field(
    'accessEdit',
    _$accessEdit,
    opt: true,
    def: false,
  );
  static bool _$accessDelete(UserAccessList v) => v.accessDelete;
  static const Field<UserAccessList, bool> _f$accessDelete = Field(
    'accessDelete',
    _$accessDelete,
    opt: true,
    def: false,
  );
  static bool _$accessPrint(UserAccessList v) => v.accessPrint;
  static const Field<UserAccessList, bool> _f$accessPrint = Field(
    'accessPrint',
    _$accessPrint,
    opt: true,
    def: false,
  );
  static bool _$accessApproveReject(UserAccessList v) => v.accessApproveReject;
  static const Field<UserAccessList, bool> _f$accessApproveReject = Field(
    'accessApproveReject',
    _$accessApproveReject,
    opt: true,
    def: false,
  );
  static String? _$createdBy(UserAccessList v) => v.createdBy;
  static const Field<UserAccessList, String> _f$createdBy = Field(
    'createdBy',
    _$createdBy,
    opt: true,
  );
  static String? _$createdDate(UserAccessList v) => v.createdDate;
  static const Field<UserAccessList, String> _f$createdDate = Field(
    'createdDate',
    _$createdDate,
    opt: true,
  );
  static String? _$updatedBy(UserAccessList v) => v.updatedBy;
  static const Field<UserAccessList, String> _f$updatedBy = Field(
    'updatedBy',
    _$updatedBy,
    opt: true,
  );
  static String? _$updatedDate(UserAccessList v) => v.updatedDate;
  static const Field<UserAccessList, String> _f$updatedDate = Field(
    'updatedDate',
    _$updatedDate,
    opt: true,
  );
  static bool? _$isMobileRequired(UserAccessList v) => v.isMobileRequired;
  static const Field<UserAccessList, bool> _f$isMobileRequired = Field(
    'isMobileRequired',
    _$isMobileRequired,
    opt: true,
    def: false,
  );
  static String? _$mobilePageRoute(UserAccessList v) => v.mobilePageRoute;
  static const Field<UserAccessList, String> _f$mobilePageRoute = Field(
    'mobilePageRoute',
    _$mobilePageRoute,
    opt: true,
  );
  static bool? _$isActive(UserAccessList v) => v.isActive;
  static const Field<UserAccessList, bool> _f$isActive = Field(
    'isActive',
    _$isActive,
    opt: true,
  );
  static String? _$endpointUrl(UserAccessList v) => v.endpointUrl;
  static const Field<UserAccessList, String> _f$endpointUrl = Field(
    'endpointUrl',
    _$endpointUrl,
    opt: true,
  );

  @override
  final MappableFields<UserAccessList> fields = const {
    #headId: _f$headId,
    #header: _f$header,
    #headerAr: _f$headerAr,
    #headerDescription: _f$headerDescription,
    #headerIconPath: _f$headerIconPath,
    #headSequenceNo: _f$headSequenceNo,
    #moduleId: _f$moduleId,
    #module: _f$module,
    #moduleDescription: _f$moduleDescription,
    #moduleIconPath: _f$moduleIconPath,
    #moduleRoute: _f$moduleRoute,
    #pageId: _f$pageId,
    #mawaniMenuSetting: _f$mawaniMenuSetting,
    #page: _f$page,
    #pageArabic: _f$pageArabic,
    #pageCode: _f$pageCode,
    #pageDescription: _f$pageDescription,
    #pageDescriptionArabic: _f$pageDescriptionArabic,
    #pageIconPath: _f$pageIconPath,
    #pageRoute: _f$pageRoute,
    #pageSequence: _f$pageSequence,
    #stakeholderCategoryRid: _f$stakeholderCategoryRid,
    #stakeholderTypeId: _f$stakeholderTypeId,
    #appId: _f$appId,
    #stakeHolderId: _f$stakeHolderId,
    #accessPageId: _f$accessPageId,
    #accessView: _f$accessView,
    #accessCreate: _f$accessCreate,
    #accessEdit: _f$accessEdit,
    #accessDelete: _f$accessDelete,
    #accessPrint: _f$accessPrint,
    #accessApproveReject: _f$accessApproveReject,
    #createdBy: _f$createdBy,
    #createdDate: _f$createdDate,
    #updatedBy: _f$updatedBy,
    #updatedDate: _f$updatedDate,
    #isMobileRequired: _f$isMobileRequired,
    #mobilePageRoute: _f$mobilePageRoute,
    #isActive: _f$isActive,
    #endpointUrl: _f$endpointUrl,
  };
  @override
  final bool ignoreNull = true;

  static UserAccessList _instantiate(DecodingData data) {
    return UserAccessList(
      headId: data.dec(_f$headId),
      header: data.dec(_f$header),
      headerAr: data.dec(_f$headerAr),
      headerDescription: data.dec(_f$headerDescription),
      headerIconPath: data.dec(_f$headerIconPath),
      headSequenceNo: data.dec(_f$headSequenceNo),
      moduleId: data.dec(_f$moduleId),
      module: data.dec(_f$module),
      moduleDescription: data.dec(_f$moduleDescription),
      moduleIconPath: data.dec(_f$moduleIconPath),
      moduleRoute: data.dec(_f$moduleRoute),
      pageId: data.dec(_f$pageId),
      mawaniMenuSetting: data.dec(_f$mawaniMenuSetting),
      page: data.dec(_f$page),
      pageArabic: data.dec(_f$pageArabic),
      pageCode: data.dec(_f$pageCode),
      pageDescription: data.dec(_f$pageDescription),
      pageDescriptionArabic: data.dec(_f$pageDescriptionArabic),
      pageIconPath: data.dec(_f$pageIconPath),
      pageRoute: data.dec(_f$pageRoute),
      pageSequence: data.dec(_f$pageSequence),
      stakeholderCategoryRid: data.dec(_f$stakeholderCategoryRid),
      stakeholderTypeId: data.dec(_f$stakeholderTypeId),
      appId: data.dec(_f$appId),
      stakeHolderId: data.dec(_f$stakeHolderId),
      accessPageId: data.dec(_f$accessPageId),
      accessView: data.dec(_f$accessView),
      accessCreate: data.dec(_f$accessCreate),
      accessEdit: data.dec(_f$accessEdit),
      accessDelete: data.dec(_f$accessDelete),
      accessPrint: data.dec(_f$accessPrint),
      accessApproveReject: data.dec(_f$accessApproveReject),
      createdBy: data.dec(_f$createdBy),
      createdDate: data.dec(_f$createdDate),
      updatedBy: data.dec(_f$updatedBy),
      updatedDate: data.dec(_f$updatedDate),
      isMobileRequired: data.dec(_f$isMobileRequired),
      mobilePageRoute: data.dec(_f$mobilePageRoute),
      isActive: data.dec(_f$isActive),
      endpointUrl: data.dec(_f$endpointUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserAccessList fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserAccessList>(map);
  }

  static UserAccessList fromJson(String json) {
    return ensureInitialized().decodeJson<UserAccessList>(json);
  }
}

mixin UserAccessListMappable {
  String toJson() {
    return UserAccessListMapper.ensureInitialized().encodeJson<UserAccessList>(
      this as UserAccessList,
    );
  }

  Map<String, dynamic> toMap() {
    return UserAccessListMapper.ensureInitialized().encodeMap<UserAccessList>(
      this as UserAccessList,
    );
  }

  UserAccessListCopyWith<UserAccessList, UserAccessList, UserAccessList>
  get copyWith => _UserAccessListCopyWithImpl<UserAccessList, UserAccessList>(
    this as UserAccessList,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return UserAccessListMapper.ensureInitialized().stringifyValue(
      this as UserAccessList,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserAccessListMapper.ensureInitialized().equalsValue(
      this as UserAccessList,
      other,
    );
  }

  @override
  int get hashCode {
    return UserAccessListMapper.ensureInitialized().hashValue(
      this as UserAccessList,
    );
  }
}

extension UserAccessListValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserAccessList, $Out> {
  UserAccessListCopyWith<$R, UserAccessList, $Out> get $asUserAccessList =>
      $base.as((v, t, t2) => _UserAccessListCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserAccessListCopyWith<$R, $In extends UserAccessList, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? headId,
    String? header,
    String? headerAr,
    String? headerDescription,
    String? headerIconPath,
    String? headSequenceNo,
    String? moduleId,
    String? module,
    String? moduleDescription,
    String? moduleIconPath,
    String? moduleRoute,
    String? pageId,
    String? mawaniMenuSetting,
    String? page,
    String? pageArabic,
    String? pageCode,
    String? pageDescription,
    String? pageDescriptionArabic,
    String? pageIconPath,
    String? pageRoute,
    String? pageSequence,
    String? stakeholderCategoryRid,
    String? stakeholderTypeId,
    String? appId,
    String? stakeHolderId,
    String? accessPageId,
    bool? accessView,
    bool? accessCreate,
    bool? accessEdit,
    bool? accessDelete,
    bool? accessPrint,
    bool? accessApproveReject,
    String? createdBy,
    String? createdDate,
    String? updatedBy,
    String? updatedDate,
    bool? isMobileRequired,
    String? mobilePageRoute,
    bool? isActive,
    String? endpointUrl,
  });
  UserAccessListCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserAccessListCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserAccessList, $Out>
    implements UserAccessListCopyWith<$R, UserAccessList, $Out> {
  _UserAccessListCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserAccessList> $mapper =
      UserAccessListMapper.ensureInitialized();
  @override
  $R call({
    Object? headId = $none,
    Object? header = $none,
    Object? headerAr = $none,
    Object? headerDescription = $none,
    Object? headerIconPath = $none,
    Object? headSequenceNo = $none,
    Object? moduleId = $none,
    Object? module = $none,
    Object? moduleDescription = $none,
    Object? moduleIconPath = $none,
    Object? moduleRoute = $none,
    Object? pageId = $none,
    Object? mawaniMenuSetting = $none,
    Object? page = $none,
    Object? pageArabic = $none,
    Object? pageCode = $none,
    Object? pageDescription = $none,
    Object? pageDescriptionArabic = $none,
    Object? pageIconPath = $none,
    Object? pageRoute = $none,
    Object? pageSequence = $none,
    Object? stakeholderCategoryRid = $none,
    Object? stakeholderTypeId = $none,
    Object? appId = $none,
    Object? stakeHolderId = $none,
    Object? accessPageId = $none,
    bool? accessView,
    bool? accessCreate,
    bool? accessEdit,
    bool? accessDelete,
    bool? accessPrint,
    bool? accessApproveReject,
    Object? createdBy = $none,
    Object? createdDate = $none,
    Object? updatedBy = $none,
    Object? updatedDate = $none,
    Object? isMobileRequired = $none,
    Object? mobilePageRoute = $none,
    Object? isActive = $none,
    Object? endpointUrl = $none,
  }) => $apply(
    FieldCopyWithData({
      if (headId != $none) #headId: headId,
      if (header != $none) #header: header,
      if (headerAr != $none) #headerAr: headerAr,
      if (headerDescription != $none) #headerDescription: headerDescription,
      if (headerIconPath != $none) #headerIconPath: headerIconPath,
      if (headSequenceNo != $none) #headSequenceNo: headSequenceNo,
      if (moduleId != $none) #moduleId: moduleId,
      if (module != $none) #module: module,
      if (moduleDescription != $none) #moduleDescription: moduleDescription,
      if (moduleIconPath != $none) #moduleIconPath: moduleIconPath,
      if (moduleRoute != $none) #moduleRoute: moduleRoute,
      if (pageId != $none) #pageId: pageId,
      if (mawaniMenuSetting != $none) #mawaniMenuSetting: mawaniMenuSetting,
      if (page != $none) #page: page,
      if (pageArabic != $none) #pageArabic: pageArabic,
      if (pageCode != $none) #pageCode: pageCode,
      if (pageDescription != $none) #pageDescription: pageDescription,
      if (pageDescriptionArabic != $none)
        #pageDescriptionArabic: pageDescriptionArabic,
      if (pageIconPath != $none) #pageIconPath: pageIconPath,
      if (pageRoute != $none) #pageRoute: pageRoute,
      if (pageSequence != $none) #pageSequence: pageSequence,
      if (stakeholderCategoryRid != $none)
        #stakeholderCategoryRid: stakeholderCategoryRid,
      if (stakeholderTypeId != $none) #stakeholderTypeId: stakeholderTypeId,
      if (appId != $none) #appId: appId,
      if (stakeHolderId != $none) #stakeHolderId: stakeHolderId,
      if (accessPageId != $none) #accessPageId: accessPageId,
      if (accessView != null) #accessView: accessView,
      if (accessCreate != null) #accessCreate: accessCreate,
      if (accessEdit != null) #accessEdit: accessEdit,
      if (accessDelete != null) #accessDelete: accessDelete,
      if (accessPrint != null) #accessPrint: accessPrint,
      if (accessApproveReject != null)
        #accessApproveReject: accessApproveReject,
      if (createdBy != $none) #createdBy: createdBy,
      if (createdDate != $none) #createdDate: createdDate,
      if (updatedBy != $none) #updatedBy: updatedBy,
      if (updatedDate != $none) #updatedDate: updatedDate,
      if (isMobileRequired != $none) #isMobileRequired: isMobileRequired,
      if (mobilePageRoute != $none) #mobilePageRoute: mobilePageRoute,
      if (isActive != $none) #isActive: isActive,
      if (endpointUrl != $none) #endpointUrl: endpointUrl,
    }),
  );
  @override
  UserAccessList $make(CopyWithData data) => UserAccessList(
    headId: data.get(#headId, or: $value.headId),
    header: data.get(#header, or: $value.header),
    headerAr: data.get(#headerAr, or: $value.headerAr),
    headerDescription: data.get(
      #headerDescription,
      or: $value.headerDescription,
    ),
    headerIconPath: data.get(#headerIconPath, or: $value.headerIconPath),
    headSequenceNo: data.get(#headSequenceNo, or: $value.headSequenceNo),
    moduleId: data.get(#moduleId, or: $value.moduleId),
    module: data.get(#module, or: $value.module),
    moduleDescription: data.get(
      #moduleDescription,
      or: $value.moduleDescription,
    ),
    moduleIconPath: data.get(#moduleIconPath, or: $value.moduleIconPath),
    moduleRoute: data.get(#moduleRoute, or: $value.moduleRoute),
    pageId: data.get(#pageId, or: $value.pageId),
    mawaniMenuSetting: data.get(
      #mawaniMenuSetting,
      or: $value.mawaniMenuSetting,
    ),
    page: data.get(#page, or: $value.page),
    pageArabic: data.get(#pageArabic, or: $value.pageArabic),
    pageCode: data.get(#pageCode, or: $value.pageCode),
    pageDescription: data.get(#pageDescription, or: $value.pageDescription),
    pageDescriptionArabic: data.get(
      #pageDescriptionArabic,
      or: $value.pageDescriptionArabic,
    ),
    pageIconPath: data.get(#pageIconPath, or: $value.pageIconPath),
    pageRoute: data.get(#pageRoute, or: $value.pageRoute),
    pageSequence: data.get(#pageSequence, or: $value.pageSequence),
    stakeholderCategoryRid: data.get(
      #stakeholderCategoryRid,
      or: $value.stakeholderCategoryRid,
    ),
    stakeholderTypeId: data.get(
      #stakeholderTypeId,
      or: $value.stakeholderTypeId,
    ),
    appId: data.get(#appId, or: $value.appId),
    stakeHolderId: data.get(#stakeHolderId, or: $value.stakeHolderId),
    accessPageId: data.get(#accessPageId, or: $value.accessPageId),
    accessView: data.get(#accessView, or: $value.accessView),
    accessCreate: data.get(#accessCreate, or: $value.accessCreate),
    accessEdit: data.get(#accessEdit, or: $value.accessEdit),
    accessDelete: data.get(#accessDelete, or: $value.accessDelete),
    accessPrint: data.get(#accessPrint, or: $value.accessPrint),
    accessApproveReject: data.get(
      #accessApproveReject,
      or: $value.accessApproveReject,
    ),
    createdBy: data.get(#createdBy, or: $value.createdBy),
    createdDate: data.get(#createdDate, or: $value.createdDate),
    updatedBy: data.get(#updatedBy, or: $value.updatedBy),
    updatedDate: data.get(#updatedDate, or: $value.updatedDate),
    isMobileRequired: data.get(#isMobileRequired, or: $value.isMobileRequired),
    mobilePageRoute: data.get(#mobilePageRoute, or: $value.mobilePageRoute),
    isActive: data.get(#isActive, or: $value.isActive),
    endpointUrl: data.get(#endpointUrl, or: $value.endpointUrl),
  );

  @override
  UserAccessListCopyWith<$R2, UserAccessList, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserAccessListCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

