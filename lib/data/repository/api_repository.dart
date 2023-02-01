import 'package:medical360_oth/data/source/network/api_result_handler.dart';

abstract class ApiRepositoryInterface {
  Future<ApiResults> getOTHToken(
      {required String username, required String password});

  Future<ApiResults> getPrimaryCall(String? username);

  Future<bool> login(String email, String password);

  Future<ApiResults> checkUsernameUnique({required String username});

  Future<ApiResults> confirmAccountService({
    required String email,
    required String username,
    required String newPassword,
    required String oldPassword,
  });

  Future<ApiResults> getMeasurmentTypes();

  Future<ApiResults> getMeasurment({required String type});

  Future<ApiResults> getQuestionnariesList();

  Future<ApiResults> getQuestionaries({required String url});

  Future<ApiResults> getDataVault(String params);
}
