import 'package:medical360_oth/exports.dart';


class QuestionariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QuestionariesController(
        apiRepositoryInterface: Get.find(),
        localRepositoryInterface: Get.find(),
      ),
    );
  }
}
