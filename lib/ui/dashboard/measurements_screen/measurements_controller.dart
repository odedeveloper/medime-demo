import 'dart:developer';

import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/models/measurement_model.dart';

class MeasurementsController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  MeasurementsController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  RxList measurementsTypeList = [].obs;
  RxBool isMeasurementTypeLoader = true.obs;
  RxBool isScatterLoader = true.obs;
  RxBool isMeasurementDataLoader = true.obs;
  MeasurmentModel? measurmentModel;

  Future fetchMesurementType() async {
    isMeasurementTypeLoader(true);
    try {
      ApiResults apiResults = await apiRepositoryInterface.getMeasurmentTypes();
      log("$apiResults");

      if (apiResults is ApiSuccess) {
        if (apiResults.data["measurment-types"].isNotEmpty) {
          measurementsTypeList.value = apiResults.data["measurment-types"];
          print(measurementsTypeList);
        }
      } else if (apiResults is ApiFailure) {
        Get.snackbar(
          margin: const EdgeInsets.all(kAppPadding),
          apiResults.message,
          "There is an error. Please try again",
          colorText: kwhite,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: kwhite),
        );
      }
    } catch (e) {
      print(e);
    }
    isMeasurementTypeLoader(false);
  }

  Future fetchMeasurementData({required String type}) async {
    isMeasurementDataLoader(true);
    ApiResults apiResults =
        await apiRepositoryInterface.getMeasurment(type: type);
    if (apiResults is ApiSuccess) {
      measurmentModel = MeasurmentModel.fromJson(apiResults.data);
    } else if (apiResults is ApiFailure) {
      Get.snackbar(
        margin: const EdgeInsets.all(kAppPadding),
        apiResults.message,
        "There is an error. Please try again",
        colorText: kwhite,
        backgroundColor: Colors.red,
        icon: const Icon(Icons.error, color: kwhite),
      );
    }
    isMeasurementDataLoader(false);
  }
}
