import 'package:medical360_oth/exports.dart';


class QuestionnairesScreen extends StatefulWidget {
  const QuestionnairesScreen({super.key});

  @override
  State<QuestionnairesScreen> createState() => _QuestionnairesScreenState();
}

class _QuestionnairesScreenState extends State<QuestionnairesScreen> {
  final controller = Get.find<QuestionariesController>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    controller.fetchQuestionnariesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: CustomAppBarWidget(
                title:drawerQuestionnaires,
                subTitle: drawerQuestionnaires,
              ),
            ),
            Expanded(
              flex: 6,
              child: controller.isQuestionariesLoader.value
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kAppPadding),
                      child: controller.questionnariesListModel == null
                          ? Center(
                              child: Text(
                                "No Data Found",
                                style: themeTextStyle(
                                  context: context,
                                  fsize: kmaxExtraLargeFont(context),
                                  fweight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context)
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 100 / 15,
                                    mainAxisSpacing: kAppPadding,
                                    crossAxisSpacing: kAppPadding,
                                  ),
                                  itemCount: controller.questionnariesListModel!
                                      .questionnaires!.length,
                                  itemBuilder: (context, index) {
                                    final data = controller
                                        .questionnariesListModel!
                                        .questionnaires![index];
                                    return QuestionnariesTypeCardWidget(data: data);
                                  },
                                )
                              : ListView.builder(
                                  itemCount: controller.questionnariesListModel!
                                      .questionnaires!.length,
                                  itemBuilder: (context, index) {
                                    final data = controller
                                        .questionnariesListModel!
                                        .questionnaires![index];
                                    return QuestionnariesTypeCardWidget(data: data);
                                  },
                                ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
