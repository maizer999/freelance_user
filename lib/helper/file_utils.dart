import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_filex/open_filex.dart';
import '../constants/api_constants.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import '../network/network_handler.dart';
import '../routes/auto_router_provider.dart';
import '../widgets/common_dialog.dart';
import '../widgets/common_text_widget.dart';

Future<void> openFileInExplorer(String filePath) async {
  try {
    final result = await OpenFilex.open(filePath);
    if (result.type != ResultType.done) {
      showErrorDialog(AppStrings.error, AppStrings.unableToOpen);
    }
  } catch (e) {
    showErrorDialog(AppStrings.error, e.toString());
  }
}

Future<void> checkWritePermission() async {
  if (!kIsWeb) {
    if (Platform.isAndroid || Platform.isIOS) {
      var permissionStatus = await Permission.storage.status;

      switch (permissionStatus) {
        case PermissionStatus.denied:
          // await Permission.manageExternalStorage.request();
          await Permission.storage.request();
          break;
        case PermissionStatus.permanentlyDenied:
          // await Permission.manageExternalStorage.request();
          // await Permission.storage.request();
          await openAppSettings();
          break;
        default:
          break;
      }
    }
  }
}

Future<String> getFileSavePath(String uniqueFileName) async {
  await checkWritePermission();
  String path = '';

  final directory = await getApplicationDocumentsDirectory();
  final appFolderPath = "${directory.path}/PMIS";

  final pmisDirectory = Directory(appFolderPath);
  if (!await pmisDirectory.exists()) {
    await pmisDirectory.create(recursive: true);
  }
  if (Platform.isAndroid) {
    path = '/storage/emulated/0/Download/PMIS/$uniqueFileName';
  } else if (Platform.isIOS) {
    path = "$appFolderPath/$uniqueFileName";
  }
  return path;

  String appDocPath = "${directory.path}/$uniqueFileName";

  Platform.isAndroid
      ? path = '/storage/emulated/0/Download/$uniqueFileName'
      : path = appDocPath;

  if (Platform.isAndroid) {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final int sdkInt = androidInfo.version.sdkInt;
    if (sdkInt == 29) {
      if (appDocPath.isNotEmpty) return appDocPath;
    }
  }

  return path;
}

Future<void> downloadAndOpenFile(
    String filePath, String fileName, BuildContext context) async {
  try {
    showDownloadProgressDialog(context);

    await checkWritePermission();

    // final savePath = await getFileSavePath("PMIS/$fileName");
    final savePath = await getFileSavePath(fileName);
    if (savePath.isEmpty) {
      Navigator.of(context).pop();
      return;
    }

    final dio = Dio();

    final response = await dio.get(
      ApiEndPoints.downloadDocument,
      queryParameters: {
        "fileName": fileName,
        "filePath": filePath,
      },
      options: Options(
        headers: await NetworkHandler.getCommonHeaders(),
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) => status != null && status < 500,
      ),
    );

    if (response.statusCode == 200) {
      final file = File(savePath);
      await file.create(recursive: true);
      await file.writeAsBytes(response.data);

      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: CommonTextWidget(
            text: "${AppStrings.fileSuccessfullyDownloaded.tr()} \n $filePath $fileName"),
        action: SnackBarAction(
          label: "open",
          onPressed: () async {
            await openFileInExplorer(savePath);
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
        margin: AppSizes.asymmetricPadding12x21,
      ));
    } else {
      Navigator.of(context).pop();
      showErrorDialog(AppStrings.downloadFailed, "");
    }
  } catch (e, stack) {
    Navigator.of(context).pop();
    showErrorDialog(AppStrings.error, e.toString());
  }
}

void showDownloadProgressDialog(BuildContext context) {
  CommonDialog(
    context: context,
    contentWidget: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 10),
        Text(AppStrings.downloading.tr())
      ],
    ),
    title: "",
    isCloseButtonRequired: false,
  );
}


void showErrorDialog(String title, String message) {
  CommonDialog(
    context: navigatorKey.currentContext!,
    contentWidget: Text(message),
    title: title,
    positiveDialogBtnText: AppStrings.ok,
    onPositiveButtonClicked: () {
      Navigator.of(navigatorKey.currentContext!).pop();
    },
  );
}

