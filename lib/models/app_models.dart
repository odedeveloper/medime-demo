import 'package:medical360_oth/exports.dart';

// ignore: constant_identifier_names
enum AppType { MedicalHealth, MedicalPharma, Medicalcords, MedicalInsurance }

class ClientApps {
  bool isInstalled = false;
  String packageName;
  String appName;
  String logo;
  AppType appType;

  ClientApps(
      {this.isInstalled = false,
      this.packageName = "",
      this.appName = "",
      this.logo = appLogo,
      this.appType = AppType.MedicalHealth});
}
