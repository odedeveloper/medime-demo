import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import 'package:medical360_oth/exports.dart';

class MeasureValueByDate {
  final int? value;
  final double? x;
  final DateTime? date;
  final double? y;

  MeasureValueByDate({this.value, this.date, this.x, this.y});
}

class ScatterChart extends StatefulWidget {
  const ScatterChart({super.key});

  @override
  State<ScatterChart> createState() => _ScatterChartState();
}

class _ScatterChartState extends State<ScatterChart> {
  final controller = Get.find<MeasurementsController>();
  List<double> scatterValue = [];

  double minYvalue = 1.0;
  double maxYvalue = 0.0;
  double minXvalue = 1.0;
  double maxXvalue = 0.0;
  List<MeasureValueByDate> measureValueByDate = [];
  @override
  void initState() {
    loadValues();
    super.initState();
  }

  loadValues() {
    controller.isScatterLoader(true);

    for (var element in controller.measurmentModel!.measurments!) {
      scatterValue.add(element.measurement!.value!.toDouble());
    }

    measureValueByDate = List.generate(
      controller.measurmentModel!.measurments!.length - 1,
      (index) => MeasureValueByDate(
        x: index.toDouble(),
        y: controller.measurmentModel!.measurments![index].measurement!.value!
            .toDouble(),
        value:
            controller.measurmentModel!.measurments![index].measurement!.value!,
        date: controller.measurmentModel!.measurments![index].timestamp!,
      ),
    );

    controller.isScatterLoader(false);
  }

  // // Generate some dummy data for the cahrt
  // // This will be used to draw the red line
  // final List<FlSpot> dummyData1 = List.generate(8, (index) {
  //   return FlSpot(index.toDouble(), index * Random().nextDouble());
  // });

  // // This will be used to draw the orange line
  // final List<FlSpot> dummyData2 = List.generate(8, (index) {
  //   return FlSpot(index.toDouble(), index * Random().nextDouble());
  // });

  // // This will be used to draw the blue line
  // final List<FlSpot> dummyData3 = List.generate(8, (index) {
  //   return FlSpot(index.toDouble(), index * Random().nextDouble());
  // });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isScatterLoader.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.all(20),
              width: width(context)! * 0.8,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: true),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: kmaxExtraLargeFont(context)! * 3,
                        getTitlesWidget: (value, meta) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(value.toString()),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        reservedSize: kmaxExtraLargeFont(context)! * 3,
                        getTitlesWidget: (value, meta) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            DateFormat('MM/dd/yyyy')
                                .format(measureValueByDate[value.toInt()].date!)
                                .toString(),
                          ),
                        ),
                      ),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  lineBarsData: [
                    // The red line

                    LineChartBarData(
                      spots: List.generate(measureValueByDate.length, (index) {
                        return FlSpot(index.toDouble(),
                            measureValueByDate[index].value!.toDouble());
                      }),
                      isCurved: true,
                      barWidth: 0.01,
                      color: Colors.indigo,
                    ),
                    // // The orange line
                    // LineChartBarData(
                    //   spots: dummyData2,
                    //   isCurved: true,
                    //   barWidth: 3,
                    //   color: Colors.red,
                    // ),
                    // // The blue line
                    // LineChartBarData(
                    //   spots: dummyData3,
                    //   isCurved: false,
                    //   barWidth: 3,
                    //   color: Colors.blue,
                    // )
                  ],
                ),
              ),
            ),
    );
  }

  getTitleData() => FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 25,
            getTitlesWidget: (value, titleMeta) {
              // if (value.toInt().isEven) {

              return Text(scatterValue[value.toInt()].toString());
              // } else {
              //   return const SizedBox.shrink();
              // }
              // return Text("$value");
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            reservedSize: 25,
            getTitlesWidget: (value, titleMeta) {
              // if (value.toInt().isEven) {
              return Text(
                DateFormat('MM/dd/yyyy')
                    .format(measureValueByDate[value.toInt()].date!)
                    .toString(),
              );
              // } else {
              //   return const SizedBox.shrink();
              // }
              // return Text("$value");
            },
          ),
        ),
      );
}
