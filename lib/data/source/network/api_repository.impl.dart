import 'dart:developer';

import 'package:medical360_oth/data/source/local/local_repository_impl.dart';
import 'package:medical360_oth/exports.dart';
import 'package:platform_device_id/platform_device_id.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  @override
  Future<ApiResults> getOTHToken(
      {required String username, required String password}) async {
    try {
      String? deviceId = await PlatformDeviceId.getDeviceId;
      log(GetStorage().read("idToken"));
      ApiResults apiResults = await DioInstance().postData(
          endPoint: getOTHTokenUrl,
          sendHeader: false,
          data: {
            "username": username,
            "password": password,
            "deviceId": deviceId ?? ""
          });
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> getPrimaryCall(String? username) async {
    ApiResults apiResults = await DioInstance().getData(
        endPoint: "$getUserEmail?username=$username", sendHeader: false);
    return apiResults;
  }

  @override
  Future<bool> login(String email, String password) async {
    try {
      CognitoUser cognitoUser =
          CognitoUser(email, userPool, storage: userPool.storage);

      final authDetails =
          AuthenticationDetails(username: email, password: password);

      CognitoUserSession session =
          (await cognitoUser.authenticateUser(authDetails))!;
      await LocalRepositoryImpl().storeAllToken(session: session);
      ApiResults apiResults2 =
          await getOTHToken(username: email, password: password);
      if (apiResults2 is ApiSuccess) {
        log("OTH token => ${apiResults2.data["token"]}");
        await LocalRepositoryImpl()
            .setOthToken(token: apiResults2.data["token"]);
        await LocalRepositoryImpl()
            .setRefreshToken(token: apiResults2.data["refreshToken"]);
      }
      return true;
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        return false;
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<ApiResults> checkUsernameUnique({required String username}) async {
    try {
      ApiResults apiResults = await DioInstance().getData(
        endPoint: "$verifyUsername?username=$username",
        // queryParameters: {"username": username},
        sendHeader: false,
      );
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> confirmAccountService(
      {required String email,
      required String username,
      required String newPassword,
      required String oldPassword}) async {
    try {
      ApiResults apiResults = await DioInstance().postData(
        endPoint: confirmAccount,
        data: {
          "email": email,
          "username": username,
          "password": newPassword,
          "oldPassword": oldPassword
        },
        sendHeader: false,
      );
      ApiResults apiResults2 =
          await getOTHToken(username: email, password: newPassword);
      if (apiResults2 is ApiSuccess) {
        log("OTH token => ${apiResults2.data["token"]}");
        await LocalRepositoryImpl()
            .setOthToken(token: apiResults2.data["token"]);
      }
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> getMeasurmentTypes() async {
    try {
      ApiResults apiResults =
          await DioInstance().getData(endPoint: fetchMeasurmentTypes);
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> getMeasurment({required String type}) async {
    try {
      ApiResults apiResults =
          await DioInstance().getData(endPoint: "$fetchMeasurment?type=$type");
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> getQuestionnariesList() async {
    try {
      ApiResults apiResults =
          await DioInstance().getData(endPoint: fetchQuestionnaireList);
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResults> getQuestionaries({required String url}) async {
    try {
      ApiResults apiResults =
          await DioInstance().getData(endPoint: "$fetchMeasurment?url=$url");
      return apiResults;
    } catch (e) {
      rethrow;
    }
  }
}
