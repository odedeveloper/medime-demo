import 'package:amazon_cognito_identity_dart_2/cognito.dart';

abstract class LocalRepositoryInterface {
  Future<String?> getToken();
  Future<void> setOthToken({required String token});
  Future<void> storeAllToken({required CognitoUserSession session});
}
