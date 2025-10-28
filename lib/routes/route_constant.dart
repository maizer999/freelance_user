import 'package:auto_route/auto_route.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String biometricLoginMessageRoute = '/biometric-login-message';
  static const String loginOptionsRoute = '/login-options';
  static const String loginOTPRoute = '/login-otp';

  static const String dashboardRoute = '/dashboard';

  ///phase 1
  static const String vesselProfileRoute = '/vessel-profile';
  static const String vesselDetailsRoute = '/vessel-details';

  static const String voyageRegistrationRoute = '/voyage-registration';
  static const String vcnAllotmentDetailsRoute = '/vcn-allotment-details';

  static const String vesselMovementTimestampRoute =
      '/vessel-movement-timestamp';
  static const String vesselMovementTimestampDetailsRoute =
      '/vessel-movement-timestamp-details';
  static const String editVesselMovementTimestampDetailsRoute =
      '/edit-vessel-movement-timestamp-details';

  static const String berthApproval = '/berth-approval';
  static const String berthRequestDetailsView = '/berth-request';
  static const String berthContainerDetailsApproval = '/berth-container';
  static const String berthCargoDetailsApproval = '/berth-cargo';
  static const String mainScreen = '/main-screen';

  static const String pilotMemo = '/pilot-memo';
  static const String pilotMemoDetail = '/pilot-detail';
  static const String addPilot = '/add-pilot';

  static const String portClearance = '/port-clearance';
  static const String portClearanceDetails = '/port-clearanceDetails';

  static const String commonDialog = '/commonDialog';

  ///phase 2
  // Vessel Shifting

  static const String vesselShiftingList = '/vesselShifting';
  static const String vesselShiftingDetails = '/vesselShiftingDetails';

  // Pre arrival notification

  static const String preArrivalNotificationList = '/pre-arrival-notification';

  static const String preArricalNotificationDetails =
      '/pre-arrival-notification-details';

  static const String preArricalNotificationCallDetails =
      '/pre-arrival-notification-call-details';

  //eta-etd
  static const String etaEtdListviewPage = '/eta-etd-list';
  static const String etaEtdDetailsPage = '/eta-etd-details';

  static const String pilotBoatDispatchPlanList = '/pilot-boat-dispatch-plan';
  static const String changePilotBoatDispatch = '/change-pilot-boat-dispatch';
  static const String pilotBoatDetails = '/pilot-boat-details';

  ///

  ///sailor-exit-permission
  static const String sailorExitPermissionList = '/sailor-exit-permission-list';
  static const String sailorExitPermissionDetails =
      '/sailor-exit-permission-details';

  static const String sailorExitSailorDetails = '/sailor-exit-sailor-details';

  ///Permit To Seafarer
  static const String permitToSeafarerList = '/permit-to-seafarer-list';
  static const String permitToSeafarerListDetails =
      '/permit-to-seafarer-details_view';

  ///Engine Maintenance Permit
  static const String engineMaintenancePermitList =
      '/engine_maintenance_permit_list';
  static const String engineMaintenancePermitDetails =
      '/engine_maintenance_permit_details_view';

  ///Lifeboat Test
  static const String lifeboatTestList = '/lifeboat-test-list';
  static const String lifeboatTestDetails = '/lifeboat-test-details';

  ///Manifest
  static const String manifestList = '/manifest-list';
  static const String manifestDetails = '/manifest_details_view';
  static const String manifestRouteDetailsView = '/manifest_route_details';
  static const String manifestBillDetailsView = '/manifest_route_details';
  static const String manifestItemDetails = '/manifest_item_route_details';
  static const String manifestAgentDetailsView = '/manifest_agent_details_view';
  static const String manifestHistoryDetailsView = '/manifest_history_details_view';
  static const String manifestEclHistoryDetailsView = '/manifest_ecl_history_details_view';



  ///Passenger/Crew List
  static const String passengerCrewList = '/passenger-crew-list';
  static const String passengerCrewDetails = '/passenger-crew-details';
  static const String passengerCrewExpansionDetails =
      '/passenger-crew-expansion-details';

  ///Hazardous Cargo Declaration
  static const String hazardousCargoDeclarationList =
      '/hazardous-cargo-declaration-list';
  static const String hazardousCargoDeclarationDetails =
      '/passenger-crew-details';

  ///Requisition Of Resource
  static const String requisitionOfResourceList =
      '/requisition-of-resource-list';
  static const String requisitionOfResourceDetails =
      '/requisition-of-resource-details';
  static const String requisitionOfResourceEquipmentDetails =
      '/requisition-of-resource-equipment-details';

  ///Forgot Password
  static const String forgotPassword = '/forgot-password';
}


final List<String> phase1Routes = [
  Routes.vesselProfileRoute,
  Routes.voyageRegistrationRoute,
  Routes.berthApproval,
  Routes.pilotMemo,
  Routes.portClearance,
  Routes.vesselMovementTimestampRoute
];
final List<String> phase2Routes = [
  Routes.vesselShiftingList,
  Routes.preArrivalNotificationList,
  Routes.etaEtdListviewPage,
  Routes.pilotBoatDispatchPlanList,
];
final List<String> phase3Pages = [
  Routes.vesselShiftingList,
  Routes.preArrivalNotificationList,
  Routes.etaEtdListviewPage,
  Routes.pilotBoatDispatchPlanList,
];
