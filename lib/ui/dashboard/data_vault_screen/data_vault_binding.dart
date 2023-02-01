import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/ui/dashboard/data_vault_screen/data_vault_controller.dart';

class DataVaultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DataVaultController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
