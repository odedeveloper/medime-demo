import 'package:medical360_oth/exports.dart';

// ignore: constant_identifier_names
enum AppType {
  Medical_Health,
  Medical_Pharma,
  Medical_Records,
  Medical_Insurance
}

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
      this.appType = AppType.Medical_Health});
}
