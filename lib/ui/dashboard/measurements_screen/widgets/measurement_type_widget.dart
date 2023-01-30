import 'package:medical360_oth/exports.dart';

class MeasurementTypeWidget extends StatefulWidget {
  final String? title;
  const MeasurementTypeWidget({super.key, this.title});

  @override
  State<MeasurementTypeWidget> createState() => _MeasurementTypeWidgetState();
}

class _MeasurementTypeWidgetState extends State<MeasurementTypeWidget> {
  final controller = Get.find<MeasurementsController>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    controller.fetchMeasurementData(type: widget.title!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
                child: Row(
                  children: const [
                    BackButton(),
                    CustomAppBarWidget(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: controller.isMeasurementDataLoader.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.measurmentModel == null
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
                            borderRadius: BorderRadius.circular(kBorderRadius),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.title!,
                                    style: themeTextStyle(
                                      context: context,
                                      fsize: kmaxExtraLargeFont(context),
                                      fweight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: EdgeInsets.all(kAppPadding),
                                  child: ScatterChart(),
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

