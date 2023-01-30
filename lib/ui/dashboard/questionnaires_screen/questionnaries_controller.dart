import 'dart:convert';
import 'dart:developer';

import 'package:medical360_oth/exports.dart';

class QuestionariesController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  QuestionariesController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  QuestionnariesListModel? questionnariesListModel;
  var questionnariesDataListModel;
  RxBool isQuestionariesLoader = true.obs;
  RxBool isQuestionariesDataLoader = true.obs;

  Future fetchQuestionnariesList() async {
    isQuestionariesLoader(true);
    ApiResults apiResults =
        await apiRepositoryInterface.getQuestionnariesList();
    log("$apiResults");

    if (apiResults is ApiSuccess) {
      if (apiResults.data["status"] == "success") {
        questionnariesListModel =
            questionnariesListModelFromJson(jsonEncode(apiResults.data));
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
    isQuestionariesLoader(false);
  }

  Future fetchQuestionnariesData({required String url}) async {
    try {
      isQuestionariesDataLoader(true);
      ApiResults apiResults =
          await apiRepositoryInterface.getQuestionaries(url: url);
      if (apiResults is ApiSuccess) {
        questionnariesDataListModel = apiResults.data;
        // questionnariesDataListModel =
        //     questionnariesDataListModelFromJson(jsonEncode(apiResults.data));
        print(apiResults.data);
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
      isQuestionariesDataLoader(false);
    } catch (e) {
      log("error $e");
      isQuestionariesDataLoader(false);
    }
  }
}
