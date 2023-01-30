import 'package:medical360_oth/exports.dart';

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  final controller = Get.find<MeasurementsController>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    controller.fetchMesurementType();
  }

  @override
  Widget build(BuildContext context) {
    return Container();

    // Scaffold(
    //   body: Obx(
    //     () => Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Expanded(
    //           child: CustomAppBarWidget(),
    //         ),
    //         Expanded(
    //           flex: 6,
    //           child: controller.isMeasurementTypeLoader.value
    //               ? const Center(child: CircularProgressIndicator())
    //               : Padding(
    //                   padding:
    //                       const EdgeInsets.symmetric(horizontal: kAppPadding),
    //                   child: controller.measurementsTypeList.isEmpty
    //                       ? Center(
    //                           child: Text(
    //                             "No Data Found",
    //                             style: themeTextStyle(
    //                               context: context,
    //                               fsize: kmaxExtraLargeFont(context),
    //                               fweight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         )
    //                       : Responsive.isDesktop(context) ||
    //                               Responsive.isTablet(context)
    //                           ? GridView.builder(
    //                               gridDelegate:
    //                                   const SliverGridDelegateWithFixedCrossAxisCount(
    //                                 crossAxisCount: 2,
    //                                 childAspectRatio: 100 / 15,
    //                                 mainAxisSpacing: kAppPadding,
    //                                 crossAxisSpacing: kAppPadding,
    //                               ),
    //                               itemCount:
    //                                   controller.measurementsTypeList.length,
    //                               itemBuilder: (context, index) {
    //                                 final data =
    //                                     controller.measurementsTypeList[index];
    //                                 return MeasurementTypeCardWidget(
    //                                     data: data);
    //                               },
    //                             )
    //                           : ListView.builder(
    //                               itemCount:
    //                                   controller.measurementsTypeList.length,
    //                               itemBuilder: (context, index) {
    //                                 final data =
    //                                     controller.measurementsTypeList[index];
    //                                 return MeasurementTypeCardWidget(
    //                                     data: data);
    //                               },
    //                             ),
    //                 ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
