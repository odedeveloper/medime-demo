import 'package:medical360_oth/exports.dart';

class SplachController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  SplachController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }

  void validateSession() async {
    final token = await localRepositoryInterface.getToken();
    if (token != null) {
      // final user = await apiRepositoryInterface.getUserFromToken(token);
      // await localRepositoryInterface.saveUser(user);
      Get.offNamed(AppRoutes.dashBoard);
    } else {
      Get.offNamed(AppRoutes.auth);
    }
  }
}
