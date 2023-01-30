import 'package:medical360_oth/exports.dart';

class QuestionnariesTypeWidget extends StatefulWidget {
  final Questionnaire? data;
  const QuestionnariesTypeWidget({super.key, this.data});

  @override
  State<QuestionnariesTypeWidget> createState() =>
      _QuestionnariesTypeWidgetState();
}

class _QuestionnariesTypeWidgetState extends State<QuestionnariesTypeWidget> {
  final controller = Get.find<QuestionariesController>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    controller.fetchQuestionnariesData(url: widget.data!.links!.questionnaire!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isQuestionariesDataLoader.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kAppPadding),
                      child: Row(
                        children: [
                          const BackButton(),
                          CustomAppBarWidget(
                            subTitle: "",
                            title: widget.data!.name!,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: controller.questionnariesDataListModel == null
                        ? Center(
                            child: Text(
                              "No Data Found",
                              style: themeTextStyle(
                                context: context,
                                fsize: klargeFont(context),
                                fweight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.all(kAppPadding),
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kwhite,
                                      borderRadius:
                                          BorderRadius.circular(kBorderRadius),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}
