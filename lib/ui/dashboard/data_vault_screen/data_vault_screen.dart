import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/ui/dashboard/data_vault_screen/data_vault_controller.dart';

class DataVaultScreen extends StatefulWidget {
  const DataVaultScreen({super.key});

  @override
  State<DataVaultScreen> createState() => _DataVaultScreenState();
}

class _DataVaultScreenState extends State<DataVaultScreen> {
  final controller = Get.find<DataVaultController>();
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    controller.fetchDataVault();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          dataVaultTitle,
          style: themeTextStyle(
            context: context,
            fsize: kmaxExtraLargeFont(context),
            fweight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isDataVaultLoad.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 100),
                  children: [
                    userVault("First Name", controller.dataVaultModel!.firstName),
                    userVault("Last Name", controller.dataVaultModel!.lastName),
                    userVault("Username", controller.dataVaultModel!.username),
                    userVault("Sex", controller.dataVaultModel!.sex),
                    userVault("DOB", controller.dataVaultModel!.dob),
                    userVault("Address", controller.dataVaultModel!.address),
                    userVault("City", controller.dataVaultModel!.city),
                    userVault(
                        "Health Care ID", controller.dataVaultModel!.healthCareId),
                    userVault(
                        "Postal Code", controller.dataVaultModel!.postalCode),
                    userVault("Patient Groups",
                        controller.dataVaultModel!.patientGroups[0].name),
                    userVault("clinician", controller.dataVaultModel!.clinician),
                    userVault(
                        "Total Measurements",
                        controller.dataVaultModel!.measurements.measurments.length
                            .toString()),
                    userVault(
                        "Total Questionnaires",
                        controller.dataVaultModel!.questionnaires
                            .questionnairesListJson.results.length
                            .toString()),
                  ],
                ),
            ),
      ),
    );
  }

  Widget userVault(String label, String data) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            //width: MediaQuery.of(context).size.width * 0.45,
            width: 194,
            height: MediaQuery.of(context).size.height * 0.05,
            color: Colors.blueGrey.shade200,
            child: Text(
              label[0].toUpperCase() + label.substring(1, label.length),
              maxLines: 2,
              style: themeTextStyle(context: context, fweight: FontWeight.w200, fontFamily: "Raleway"),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            //width: MediaQuery.of(context).size.width * 0.45,
            width: 197,
            height: MediaQuery.of(context).size.height * 0.05,
            color: Colors.blueGrey.shade100,
            child: Text(
              data[0].toUpperCase() + data.substring(1, data.length),
              maxLines: 2,
              style: themeTextStyle(context: context, fweight: FontWeight.w500, fontFamily: "Arial"),
            ),
          ),
        ],
      ),
    );
  }
}
