import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DownloadDialogView extends ConsumerStatefulWidget {
  final String? apiEndpoint;
  final Map<String, dynamic> params;
  final VoidCallback? onDownloaded;
  final bool openFile;

  const DownloadDialogView(this.params,
      {super.key, this.apiEndpoint, this.onDownloaded, this.openFile = false});

  @override
  ConsumerState<DownloadDialogView> createState() => _DownloadDialogViewState();
}

class _DownloadDialogViewState extends ConsumerState<DownloadDialogView> {
  // Updated method with custom logger
  Future<void> openDownloadedDocument(String path) async {
    // try {
    //   final result = await OpenFilex.open(path);
    //   final message = switch (result.type) {
    //     ResultType.done => null,
    //     ResultType.fileNotFound => AppLocal.fileNotFound,
    //     ResultType.noAppToOpen => AppLocal.noAppToOpen,
    //     ResultType.permissionDenied => AppLocal.permissionDenied,
    //     ResultType.error => AppLocal.error,
    //   };
    //   if (message != null) {
    //     ref
    //         .read(autoRouterProvider)
    //         .navigate(CommonResponseDialogRoute(responseMessage: message));
    //   }
    // } catch (e, _) {
    //   ref.read(autoRouterProvider).navigate(
    //         CommonResponseDialogRoute(responseMessage: AppLocal.unableToOpen),
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final DownloadArgument downloadArgument = (
    //   params: widget.params,
    //   apiEndpoint: widget.apiEndpoint,
    //   openFile: widget.openFile
    // );
    // final downloadStateAsync =
    //     ref.watch(downloadNotifierProvider(downloadArgument));
    // ref.listen(
    //   downloadNotifierProvider(downloadArgument),
    //   (previous, next) {
    //     if (next is AsyncData && next.valueOrNull != null) {
    //       final state = next.requireValue;
    //       if (state is DownloadCompleted) {
    //         if (widget.onDownloaded != null) {
    //           widget.onDownloaded!();
    //         }
    //         context.router.pop();
    //
    //         if (widget.openFile) {
    //           openDownloadedDocument(
    //             state.downloadedFilePath,
    //           );
    //         } else {
    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //             backgroundColor: AppColors.kPrimaryColor, // background color
    //             content: CommonTextWidget(
    //                 text:
    //                     "${AppLocal.fileSuccessfullyDownloaded.tr()} \n ${state.downloadedFilePath}"),
    //             action: SnackBarAction(
    //               label: AppLocal.openFile.tr(),
    //               onPressed: () async {
    //                 await openFileInExplorer(state.downloadedFilePath);
    //               },
    //             ),
    //             behavior: SnackBarBehavior.floating,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(AppSizes.radius8),
    //             ),
    //             margin: AppSizes.asymmetricPadding12x21,
    //           ));
    //         }
    //       }
    //     }
    //   },
    // );
    //
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // downloadStateAsync.when(
          //   data: (downloadState) {
          //     return switch (downloadState) {
          //       InitialDownload() =>
          //         const CommonTextWidget(text: AppLocal.downloadNotstarted),
          //       Downloading() => Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             CircularProgressIndicator(
          //               value: downloadState.progress,
          //             ),
          //             SizedBox(height: 16.h),
          //             Text(
          //               '${(downloadState.progress * 100).toStringAsFixed(0)}%',
          //             ),
          //             SizedBox(height: 16.h),
          //             ElevatedButton(
          //               onPressed: () {
          //                 ref
          //                     .read(
          //                       downloadNotifierProvider(downloadArgument)
          //                           .notifier,
          //                     )
          //                     .cancelDownload();
          //                 Navigator.pop(context);
          //               },
          //               child: const CommonTextWidget(
          //                 text: AppLocal.cancelDownload,
          //               ),
          //             ),
          //           ],
          //         ),
          //       DownloadCompleted() => Column(
          //           children: [
          //             const CommonTextWidget(
          //               text: AppLocal.downloadCompleted,
          //             ),
          //             SizedBox(height: 16.h),
          //             ElevatedButton(
          //               onPressed: () {
          //                 ref
          //                     .read(
          //                       downloadNotifierProvider(downloadArgument)
          //                           .notifier,
          //                     )
          //                     .cancelDownload();
          //                 Navigator.pop(context);
          //               },
          //               child: const CommonTextWidget(
          //                 text: AppLocal.ok,
          //               ),
          //             ),
          //           ],
          //         ),
          //       DownloadFailed(:final errorMessage) => Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Text(errorMessage),
          //             SizedBox(height: 16.h),
          //             ElevatedButton(
          //               onPressed: () {
          //                 ref
          //                     .read(
          //                       downloadNotifierProvider(downloadArgument)
          //                           .notifier,
          //                     )
          //                     .cancelDownload();
          //                 Navigator.pop(context);
          //               },
          //               child: const CommonTextWidget(
          //                 text: AppLocal.ok,
          //               ),
          //             ),
          //           ],
          //         ),
          //     };
          //   },
          //   loading: () {
          //     return Column(
          //       children: [
          //         const CircularProgressIndicator(),
          //         const SizedBox(height: 16),
          //         ElevatedButton(
          //           onPressed: () {
          //             ref
          //                 .read(
          //                   downloadNotifierProvider(downloadArgument).notifier,
          //                 )
          //                 .cancelDownload();
          //             Navigator.pop(context);
          //           },
          //           child: const CommonTextWidget(
          //             text: AppLocal.cancelDownload,
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          //   error: (error, stack) => CommonTextWidget(text: ' $error'),
          // ),
        ],
      ),
    );
  }
}

void openDownloadDialog(BuildContext context, Map<String, dynamic> params,
    {String? apiEndpoint, VoidCallback? onDownloaded, bool openFile = false}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DownloadDialogView(
            params,
            apiEndpoint: apiEndpoint ?? "",
            onDownloaded: onDownloaded,
            openFile: openFile,
          ),
        );
      });
}
