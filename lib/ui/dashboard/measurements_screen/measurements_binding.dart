import 'package:medical360_oth/exports.dart';

class MeasurementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MeasurementsController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
