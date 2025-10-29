import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_intercept_to_curl/dio_intercept_to_curl.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_cache_hive_store/http_cache_hive_store.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../../../main.dart';
import 'package:mime/mime.dart';
import '../constants/app_strings.dart';
import '../exceptions/exceptions.dart';
import 'package:path_provider/path_provider.dart';

import '../helper/file_utils.dart';
import '../helper/language/secure_storage.dart';
import '../helper/system_preferences_helper.dart';
import '../routes/auto_route_observer.dart';

class NetworkHandler {
  static final _okRange = [for (var i = 200; i <= 399; i++) i];
  static final _clientErrorsRange = [for (var i = 400; i <= 499; i++) i];
  static final _serverErrorsRange = [for (var i = 500; i <= 599; i++) i];

  static Map<String, dynamic> currentRequest = {};

  static Future<Dio> getDio({bool isPCs = false}) async {
    Dio dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 90);
    dio.options.receiveTimeout = const Duration(seconds: 90);

    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: TalkerDioLoggerSettings(
            responseFilter: (response) {
              return !response.requestOptions.path.contains("locale-map");
            },
          ),
        ),
      );

      dio.interceptors.add(DioInterceptToCurl(printOnSuccess: true));
    }

    dio.interceptors.add(DioCacheInterceptor(options: await getCacheOptions()));
    return dio;
  }

  static Future<CacheOptions> getCacheOptions() async {
    var cacheDir = await getApplicationCacheDirectory();
    var cacheStore = HiveCacheStore(
      cacheDir.path,
      hiveBoxName: "requestsBox",
    );

    var customCacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.request,
      priority: CachePriority.high,
      maxStale: const Duration(days: 1),
      hitCacheOnErrorCodes: [401, 404],
      // keyBuilder: (request,s) {

      //   return compressString(request.uri.toString());
      // },
      allowPostMethod: false,
    );

    return customCacheOptions;
  }

  static String compressString(String input) {
    List<int> inputBytes = utf8.encode(input);
    List<int> compressedBytes = zlib.encode(inputBytes);
    String compressedBase64 = base64.encode(compressedBytes);

    if (compressedBase64.length > 255) {
      var hash =
          base64.encode(sha256.convert(inputBytes).bytes).substring(0, 6);
      return compressedBase64.substring(0, 249) + hash; // Ensure ≤ 255
    }

    return compressedBase64;
  }

  static void prepareCurrentRequest(
    String endpoint,
    Map<String, dynamic>? params,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    NetworkRequestType requestType, {
    String? fileName,
  }) {
    currentRequest["endpoint"] = endpoint;
    currentRequest["params"] = params;
    currentRequest["data"] = data;
    currentRequest["requestType"] = requestType;
    currentRequest["fileName"] = fileName;
  }

  static Future getRequest(
      {required String endpoint,
      Map<String, dynamic>? params,
      Map<String, dynamic>? data,
      required Map<String, String> headers,
      CancelToken? cancelToken,
      bool isPCs = false}) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.get,
      );
      Response<dynamic> response = await (await getDio(isPCs: isPCs)).get(
        endpoint,
        queryParameters: params,
        data: data,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
      return _handleResult(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future postRequest(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params,
      required Map<String, String> headers,
      CancelToken? cancelToken,
      bool isPCs = false}) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.post,
      );

      Response<dynamic> response = await (await getDio(isPCs: isPCs)).post(
        endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );

      return _handleResult(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future postMultiPartRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.postMultipart,
      );

      var formData = await prepareMultiPartData(data);

      Response<dynamic> response = await (await getDio()).post(
        endpoint,
        data: formData,
        queryParameters: params,
        options: Options(headers: headers),
      );

      return _handleResult(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future downloadGetRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
    required String fileName,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.getDownLoad,
        fileName: fileName,
      );

      Response<dynamic> response = await (await getDio()).get(
        endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers, responseType: ResponseType.stream),
      );

      return _handleResult(response, fileName: fileName);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future downloadPostRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
    required String fileName,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.postDownload,
        fileName: fileName,
      );

      Response<dynamic> response = await (await getDio()).post(
        endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers, responseType: ResponseType.stream),
      );

      return _handleResult(response, fileName: fileName);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future putRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.put,
      );
      Response<dynamic> response = await (await getDio()).put(
        endpoint,
        data: data,
        queryParameters: params,
        options: Options(headers: headers),
      );
      return _handleResult(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future putMultiPartRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.putMultipart,
      );
      var formData = await prepareMultiPartData(data);
      Response<dynamic> response = await (await getDio()).put(
        endpoint,
        data: formData,
        queryParameters: params,
        options: Options(headers: headers),
      );
      return _handleResult(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  static Future<FormData> prepareMultiPartData(
    Map<String, dynamic>? data,
  ) async {
    FormData formData = FormData();
    List<MapEntry<String, dynamic>>? entries = data?.entries.toList();
    await Future.forEach(entries ?? [], (entry) async {
      if (entry.value is File) {
        String fileName = entry.value.path.split('/').last;
        var mimeType = lookupMimeType(entry.value.path);
        if (mimeType != null) {
          formData.files.add(
            MapEntry(
              entry.key,
              MultipartFile.fromFileSync(
                entry.value.path,
                filename: fileName,
                contentType: DioMediaType.parse(mimeType),
              ),
            ),
          );
        }
      } else {
        formData.fields.add(MapEntry(entry.key, entry.value.toString()));
      }
    });

    return formData;
  }

  static Future deleteRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    try {
      prepareCurrentRequest(
        endpoint,
        params,
        data,
        headers,
        NetworkRequestType.delete,
      );

      Response<dynamic> response = await (await getDio()).delete(
        endpoint,
        data: jsonEncode(data),
        queryParameters: params,
        options: Options(headers: headers),
      );

      return _handleResult(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future sendMultiPartRequest({
    required String endpoint,
    required String type,
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    required Map<String, String> headers,
  }) async {
    var uri = Uri.parse(endpoint);

    if (params != null) {
      params.forEach((key, value) {
        if (value is String) {
          uri.queryParameters[key] = value;
        }
      });
    }
    var request = http.MultipartRequest(type, uri);
    request.headers.addAll(headers);

    List<MapEntry<String, dynamic>>? entries = data?.entries.toList();

    await Future.forEach(entries ?? [], (entry) async {
      if (entry.value is File) {
        var mimeType = lookupMimeType(entry.value.path);
        if (mimeType != null) {
          String fileName = entry.value.path.split('/').last;
          final file = await http.MultipartFile.fromPath(
            entry.key,
            entry.value.path,
            filename: fileName,
            contentType: DioMediaType.parse(mimeType),
          );
          request.files.add(file);
        }
      } else {
        request.fields[entry.key] = entry.value.toString();
      }
    });

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _handleHttpResult(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future _handleDioError(DioException e) {
    AppException exception;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        exception = ConnectionIssueException(response: e.response?.data);
        break;
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401) {
          exception = AuthenticationFailedException(response: e.response?.data);
        } else if (e.response?.statusCode == 404) {
          exception = NotFoundException();
        } else if (e.response?.statusCode == 405) {
          exception = InvalidRequestException();
        } else if (e.response?.statusCode == 503) {
          if (e.response?.data is Map) {
            exception = ServiceUnavailableException(
                response: e.response?.data as Map<String, dynamic>);
          } else {
            exception = ServiceUnavailableException(response: {
              "responseMessage": AppStrings.serverCurrentlyUnavailable
            });
          }
        } else if (e.response?.data != null) {
          final responseData = e.response?.data as Map<String, dynamic>?;
          exception = ServerErrorException(response: responseData);
        } else {
          exception = ServerErrorException();
        }
        break;

      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        if (e.response?.data is Map) {
          exception = ServerErrorException(response: e.response?.data);
        } else {
          exception = ServerErrorException();
        }

        break;
      case DioExceptionType.unknown:
        exception = ServerErrorException(response: e.response?.data);
        break;
    }
    throw exception;
  }

  static Future _handleResult(
    Response<dynamic> response, {
    String? fileName,
  }) async {
    try {
      int statusCode = response.statusCode ?? 0;
      var responseBody = response.data;
      switch (response.data.runtimeType) {
        case List _:
          response.data;
          break;

        case Map _:
          responseBody = response.data;
          break;

        case const (String):
          if ((response.data as String).isNotEmpty) {
            responseBody = response.data;
          }
          break;

        case const (bool):
          responseBody = {'outputBool': response.data as bool};
          break;

        case const (int):
          responseBody = {'outputInt': response.data as int};
          break;
      }

      if (_okRange.contains(statusCode)) {
        if (fileName != null) {
          // Directory appDocDir = await getApplicationDocumentsDirectory();
          // String savePath = "${appDocDir.path}/$fileName";
          String savePath = await getFileSavePath(fileName);

          File file = File(savePath);
          var sink = file.openWrite();
          await sink.addStream(response.data.stream).catchError((error) {
            throw error;
          });

          await sink.close();

          return savePath;
        } else if (responseBody == null || responseBody.isEmpty) {
          return {"success": true};
        } else {
          return responseBody;
        }
      } else if (_clientErrorsRange.contains(statusCode)) {
        AppException exception;
        switch (statusCode) {
          case 400:
          case 404:
          case 405:
            exception = InvalidRequestException(response: responseBody);
            break;
          case 401:
          case 403:
            exception = AuthenticationFailedException(response: responseBody);
          case 408:
            exception = ConnectionIssueException(response: responseBody);
            break;
          case 500:
            exception = ServerErrorException(response: responseBody);
            break;

          default:
            exception = ServerErrorException(response: responseBody);
            break;
        }

        throw exception;
      } else if (_serverErrorsRange.contains(statusCode)) {
        throw ServerErrorException(response: responseBody);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          message: "Unexpected status",
        );
      }
    } on DioException catch (e) {
      AppException exception;
      switch (e.type) {
        case DioExceptionType.badResponse:
        case DioExceptionType.badCertificate:
        case DioExceptionType.connectionError:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          exception = ConnectionIssueException(response: response.data);
          break;
        case DioExceptionType.unknown:
          exception = UnknownErrorException(response: response.data);
          break;
      }
      throw exception;
    } on UnsupportedError {
      throw UnknownErrorException();
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  static Future _handleHttpResult(http.Response response) async {
    try {
      int statusCode = response.statusCode;
      var responseBody = {'outputString': response.body};
      if (_okRange.contains(statusCode)) {
        if (responseBody.isEmpty) {
          return {"success": true};
        } else {
          return responseBody;
        }
      } else if (_clientErrorsRange.contains(statusCode)) {
        AppException exception;
        switch (statusCode) {
          case 400:
          case 404:
          case 405:
            exception = InvalidRequestException(response: responseBody);
            break;
          case 401:
          case 403:
            exception = AuthenticationFailedException(response: responseBody);
            break;

          case 408:
            exception = ConnectionIssueException(response: responseBody);
            break;
          default:
            exception = ServerErrorException(response: responseBody);
            break;
        }

        throw exception;
      } else if (_serverErrorsRange.contains(statusCode)) {
        throw ServerErrorException(response: responseBody);
      }
    } on UnsupportedError {
      throw UnknownErrorException();
    } catch (e) {
      throw UnknownErrorException();
    }
  }

  static Future<Map<String, String>> getFormUrlencodedHeaders() async {
    var languageCode = await SystemPreferencesHelper.getLanguageCode();

    return {
      "Content-Type": "application/x-www-form-urlencoded",
      'Accept': 'application/json',
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonPostHeaders(
      {bool isPCs = false}) async {
    var languageCode = await SystemPreferencesHelper.getLanguageCode();
    var token = isPCs
        ? await SecureStorageHelper.getPCSAccessToken()
        : await SecureStorageHelper.getAccessToken();

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonPutHeaders() async {
    var languageCode = await SystemPreferencesHelper.getLanguageCode();
    var token = await SecureStorageHelper.getAccessToken();

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonHeaders(
      {bool isPCs = false}) async {
    var languageCode = await SystemPreferencesHelper.getLanguageCode();
    var token = isPCs
        ? await SecureStorageHelper.getPCSAccessToken()
        : await SecureStorageHelper.getAccessToken();
    return {
      "Authorization": "Bearer $token",
      'Accept-Language': languageCode ?? 'en',
    };
  }

  static Future<Map<String, String>> getCommonHeadersWithoutToken() async {
    return {"Content-Type": "text"};
  }

  static Future<Map<String, String>> getCommonMultipartHeaders() async {
    var token = getTempAccessToken();

    token ??= await getAccessToken();

    return {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };
  }

  static String? getTempAccessToken() {
    final secureStorage = providerContainer.read(secureStorageProvider);
    var token = secureStorage.getTemp(key: 'access_token');

    return token;
  }

  static Future<String?> getAccessToken() async {
    final secureStorage = SecureStorageHelper.getAccessToken();
    return secureStorage;
  }
}

enum NetworkRequestType {
  get,
  post,
  postMultipart,
  postDownload,
  getDownLoad,
  put,
  putMultipart,
  delete,
}

Future<T> safeApiCall<T>(Future<T> Function() operation,
    {bool checkInternet = true}) async {
  // if (await NetworkInfo().isConnected || checkInternet == false) {
  try {
    return await operation();
  } on MapperException catch (e) {
    if (kDebugMode) {
      print(e);
    }
    throw MalformedOutputException();
  } on AppException {
    rethrow;
  } catch (error) {
    throw ServerErrorException();
  }
  // } else {
  //   throw ConnectionIssueException();
  // }
}
