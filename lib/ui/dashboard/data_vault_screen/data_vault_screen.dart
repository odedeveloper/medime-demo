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
            : ListView(
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
                      "HealthCareID", controller.dataVaultModel!.healthCareId),
                  userVault(
                      "PostalCode", controller.dataVaultModel!.postalCode),
                  userVault("patientGroups",
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
    );
  }

  Widget userVault(String label, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$label : $data",
        maxLines: 2,
        style: themeTextStyle(context: context),
      ),
    );
  }
}
