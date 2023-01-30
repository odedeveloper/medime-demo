import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:medical360_oth/exports.dart';

class DioInstance {
  // late Dio dio;

  // DioInstance() {
  //   BaseOptions baseOptions = BaseOptions(
  //     baseUrl: baseUrl,
  //     receiveDataWhenStatusError: true,
  //     // connectTimeout: 70000,
  //     // receiveTimeout: 70000,
  //   );
  //   dio = Dio(baseOptions);
  // }

  Map<String, String> apiHeader = {
    'Authorization': GetStorage().read("idToken") ?? "",
    "oth_token": GetStorage().read("othTokenId") ?? "",
  };

  Future<ApiResults> getData({
    required String endPoint,
    bool sendHeader = true,
    String? token,
  }) async {
    try {
      print(apiHeader);
      Uri url = Uri.parse("$baseUrl$endPoint");
      var response =
          await http.get(url, headers: sendHeader ? apiHeader : null);
      log(response.statusCode.toString());
      log('base:    $url');
      log('url:    $endPoint');
      log('response:    $response');

      return ApiSuccess(await jsonDecode(response.body), response.statusCode);
    } on SocketException {
      return ApiFailure("There is no internet connection");
    } on FormatException {
      return ApiFailure("An error occurred in the data format");
    }
    // on HttpException catch (e) {
    //   if (e. == DioErrorType.response) {
    //     // return ApiFailure(e.response!.data['message']);
    //     return ApiFailure(e.message);
    //   } else if (e.type == DioErrorType.connectTimeout) {
    //     // print('check your connection');
    //     return ApiFailure("Make sure you are connected to the Internet");
    //   } else if (e.type == DioErrorType.receiveTimeout) {
    //     // print('unable to connect to the server');
    //     return ApiFailure("Unable to connect to the server");
    //   } else {
    //     return ApiFailure("An error occurred, try again");
    //   }
    // }
    catch (e) {
      return ApiFailure("An error occurred, try again");
    }
  }

  Future<ApiResults> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    bool formData = false,
    bool sendHeader = true,
    String? token,
  }) async {
    try {
      Uri url = Uri.parse("$baseUrl$endPoint");
      var response = await http.post(
        url,
        headers: sendHeader ? apiHeader : null,
        body: jsonEncode(data),
      );
      log('base:    $url');
      log('url:    $endPoint');
      log('response:    $response');

      return ApiSuccess(jsonDecode(response.body), response.statusCode);
    }
    //  on SocketException {
    //   return ApiFailure("There is no internet connection");
    // } on FormatException {
    //   return ApiFailure("An error occurred in the data format");
    // } on DioError catch (e, stacktrace) {
    //   if (e.type == DioErrorType.response) {
    //     // return ApiFailure(e.response!.data['message']);
    //     log("$stacktrace");
    //     return ApiFailure(e.message);
    //   } else if (e.type == DioErrorType.connectTimeout) {
    //     // print('check your connection');
    //     return ApiFailure("Make sure you are connected to the Internet");
    //   } else if (e.type == DioErrorType.receiveTimeout) {
    //     // print('unable to connect to the server');
    //     return ApiFailure("Unable to connect to the server");
    //   } else {
    //     return ApiFailure("An error occurred, try again");
    //   }
    // }
    on SocketException {
      return ApiFailure("There is no internet connection");
    } on FormatException {
      return ApiFailure("An error occurred in the data format");
    } catch (e) {
      return ApiFailure("An error occurred, try again");
    }
  }

  Future<String> fetchAuthToken() async {
    String token = GetStorage().read("idToken") ?? "";
    return token.toString();
  }
}
