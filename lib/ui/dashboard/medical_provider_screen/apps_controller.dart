import 'dart:developer';

import 'package:device_apps/device_apps.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/models/app_models.dart';
import 'package:medical360_oth/models/measurement_model.dart';
import 'package:medical360_oth/services/file_downloader.dart';

class AppsController extends GetxController {
  final ApiRepositoryInterface apiRepositoryInterface;
  AppsController({
    required this.apiRepositoryInterface,
  });

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addClientApps();
  }

  Map<AppType, List<ClientApps>> allApps = {};
  bool isLoading = true;

  List<ClientApps> allClientApps = [];
  List originalListApps = [
    ClientApps(
        isInstalled: true,
        packageName: "dk.silverbullet.telemed",
        appName: "DigiHealth",
        logo: tele1),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "Consult",
        logo: tele2),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "ReHealth",
        logo: tele3),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "DocOne",
        logo: tele4),
    ClientApps(
        isInstalled: true,
        packageName: "dk.silverbullet.telemed",
        appName: "DigiPharma",
        appType: AppType.Medical_Pharma,
        logo: pharmacy1),
    ClientApps(
        isInstalled: true,
        packageName: "dk.silverbullet.telemed",
        appName: "PharmaOne",
        appType: AppType.Medical_Pharma,
        logo: pharmacy2),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "DigiRecords",
        appType: AppType.Medical_Records,
        logo: record1),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "DigiInsure",
        appType: AppType.Medical_Insurance,
        logo: insurance1),
    ClientApps(
        isInstalled: true,
        packageName: "silverbullet.telemed",
        appName: "TeleInsure",
        appType: AppType.Medical_Insurance,
        logo: insurance2),
  ];

  Future addClientApps() async {
    for (AppType type in AppType.values) {
      List<ClientApps> installedClientApps = [];
      List<ClientApps> toInstallClientApps = [];
      for (ClientApps i in originalListApps) {
        if (i.appType == type) {
          bool a = await DeviceApps.isAppInstalled(i.packageName);
          if (a) {
            i.isInstalled = true;
            installedClientApps.add(i);
          } else {
            toInstallClientApps.add(i);
          }
        }
      }
      allApps[type] = installedClientApps + toInstallClientApps;
    }
    print(allApps);
    isLoading = false;
    update();
  }

  downloadFile(String appName) async {
    String url =
        "https://medical-integrated-apps-bucket.s3.us-east-1.amazonaws.com/";
    String taskId = await FileDownloader()
            .createDownloadTask(url: "$url$appName", fileName: "$appName") ??
        "";
    return taskId;
  }
}
