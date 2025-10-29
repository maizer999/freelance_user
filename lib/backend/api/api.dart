import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ApiService extends GetxService {
  final String appBaseUrl;

  static const String connectionIssue = 'Connection failed!';
  final int timeoutInSeconds = 30;

  ApiService({required this.appBaseUrl});

  Future<Response> getPublic(String uri) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('GET Public URL: $fullUrl');  // Print the full URL here
      http.Response response = await http.get(Uri.parse(fullUrl)).timeout(Duration(seconds: timeoutInSeconds));
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Future<Response> getPrivate(String uri, String token) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('GET Private URL: $fullUrl');  // Print the full URL here
      http.Response response = await http.get(Uri.parse(fullUrl), headers: {'Content-Type': 'application/json;', 'Authorization': 'Bearer $token'}).timeout(Duration(seconds: timeoutInSeconds));
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Future<Response> getOther(String uri) async {
    try {
      print('GET Other URL: $uri');  // Print the URL directly here
      http.Response response = await http.get(Uri.parse(uri)).timeout(Duration(seconds: timeoutInSeconds));
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Future<Response> uploadFiles(String uri, List<MultipartBody> multipartBody) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('UPLOAD Files URL: $fullUrl');  // Print the full URL here
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(fullUrl));
      for (MultipartBody multipart in multipartBody) {
        File file = File(multipart.file.path);
        request.files.add(http.MultipartFile(multipart.key, file.readAsBytes().asStream(), file.lengthSync(), filename: file.path.split('/').last));
      }
      http.Response response = await http.Response.fromStream(await request.send());
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Future<Response> postPublic(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('POST Public URL: $fullUrl');  // Print the full URL here

      // Constructing the cURL command
      StringBuffer curlCommand = StringBuffer();
      curlCommand.writeln('curl -X POST "$fullUrl"');

      // Add headers to the cURL command
      Map<String, String> requestHeaders = {
        "Content-Type": "application/json",
        if (headers != null) ...headers,
      };

      requestHeaders.forEach((key, value) {
        curlCommand.writeln("-H \"$key: $value\"");
      });

      // Add body to the cURL command (if body is not null)
      if (body != null) {
        curlCommand.writeln("-d '${jsonEncode(body)}'");
      }

      // Print the generated cURL command
      print('Generated cURL:');
      print(curlCommand.toString());

      // Making the actual request
      http.Response response = await http.post(Uri.parse(fullUrl),
          headers: requestHeaders, body: jsonEncode(body)).timeout(Duration(seconds: timeoutInSeconds));

      // Print the response for debugging purposes
      print('Response: $response');

      return parseResponse(response, appBaseUrl + uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }


  Future<Response> postPrivate(String uri, dynamic body, String token) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('POST Private URL: $fullUrl');  // Print the full URL here
      http.Response response = await http.post(Uri.parse(fullUrl), body: jsonEncode(body), headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'}).timeout(Duration(seconds: timeoutInSeconds));
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Future<Response> logout(String uri, String token) async {
    try {
      String fullUrl = appBaseUrl + uri;
      print('LOGOUT URL: $fullUrl');  // Print the full URL here
      http.Response response = await http.post(Uri.parse(fullUrl), headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'}).timeout(Duration(seconds: timeoutInSeconds));
      return parseResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: connectionIssue);
    }
  }

  Response parseResponse(http.Response res, String uri) {
    dynamic body;
    try {
      body = jsonDecode(res.body);
    } catch (e) {
      e;
    }
    Response response = Response(body: body != '' ? body : res.body, bodyString: res.body.toString(), headers: res.headers, statusCode: res.statusCode, statusText: res.reasonPhrase);
    if (response.statusCode != 200 && response.body != null && response.body is! String) {
      if (response.body.toString().startsWith('{errors: [{code:')) {
        response = Response(statusCode: response.statusCode, body: response.body, statusText: 'error');
      } else if (response.body.toString().startsWith('{message')) {
        response = Response(statusCode: response.statusCode, body: response.body, statusText: response.body['message']);
      }
    } else if (response.statusCode != 200 && response.body == null) {
      response = const Response(statusCode: 0, statusText: connectionIssue);
    }

    return response;
  }
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
