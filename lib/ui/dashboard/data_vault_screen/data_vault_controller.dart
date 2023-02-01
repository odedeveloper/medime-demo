import 'dart:convert';

import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/models/data_vault_model.dart';

class DataVaultController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  DataVaultController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  RxBool isDataVaultLoad = true.obs;

  DataVaultModel? _dataVaultModel;
  DataVaultModel? get dataVaultModel => _dataVaultModel;
  set dataVaultModel(DataVaultModel? val) {
    _dataVaultModel = val;
    update();
  }

  Future fetchDataVault() async {
    try {
      await apiRepositoryInterface
          .getDataVault(localRepositoryInterface.getUserCred() ?? "")
          .then((apiResult) {
        if (apiResult is ApiSuccess) {
          dataVaultModel = dataVaultModelFromJson(jsonEncode(apiResult.data));
        }
      });
    } catch (e) {
      print(e);
    }
    isDataVaultLoad(false);
  }
}
