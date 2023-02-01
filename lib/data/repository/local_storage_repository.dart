import 'package:amazon_cognito_identity_dart_2/cognito.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<String?> getRefreshToken();
  Future<void> setOthToken({required String token});
  Future<void> setRefreshToken({required String token});
  Future<void> storeAllToken({required CognitoUserSession session});
}
