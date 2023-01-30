import 'package:medical360_oth/exports.dart';

class DashBoardBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashBoardController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
