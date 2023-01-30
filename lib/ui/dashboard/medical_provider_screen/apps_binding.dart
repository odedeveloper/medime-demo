import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/ui/dashboard/medical_provider_screen/apps_controller.dart';

class AppsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AppsController(
        apiRepositoryInterface: Get.find(),
      ),
    );
  }
}