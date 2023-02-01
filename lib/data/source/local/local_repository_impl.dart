import 'dart:developer';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical360_oth/data/repository/local_storage_repository.dart';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<String?> getToken() async {
    String? token = GetStorage().read("idToken");
    return token;
  }

  @override
  Future<String?> getRefreshToken() async {
    String? token = GetStorage().read("refresh");
    return token;
  }

  @override
  Future<void> storeAllToken({required CognitoUserSession session}) async {
    GetStorage deviceStorage = GetStorage();
    log(session.getIdToken().jwtToken!);
    await deviceStorage.write("idToken", session.getIdToken().jwtToken);
    await deviceStorage.write(
        "idTokenExp", session.getIdToken().payload['exp']);
    await deviceStorage.write(
        "idTokenIAT", session.getIdToken().payload['iat']);
    if (session.getRefreshToken() != null) {
      await deviceStorage.write(
          "refreshToken", session.getRefreshToken()?.token);
    }
    await deviceStorage.write("accessToken", session.getAccessToken().jwtToken);
    await deviceStorage.write(
        "accessTokenExp", session.getAccessToken().payload['exp']);
    await deviceStorage.write(
        "accessTokenIAT", session.getAccessToken().payload['iat']);
  }

  @override
  Future<void> setOthToken({required String token}) async {
    GetStorage deviceStorage = GetStorage();
    await deviceStorage.write('othTokenId', token);
  }

  @override
  Future<void> setRefreshToken({required String token}) async {
    GetStorage deviceStorage = GetStorage();
    await deviceStorage.write('refresh', token);
  }
}
