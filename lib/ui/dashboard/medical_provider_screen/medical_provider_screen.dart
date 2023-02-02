import 'dart:io';

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/models/app_models.dart';
import 'package:medical360_oth/ui/dashboard/medical_provider_screen/apps_controller.dart';
import 'package:medical360_oth/ui/dashboard/medical_provider_screen/webview_apps/ios_webapp.dart';

class MedicalProviderScreen extends GetWidget<AppsController> {
  const MedicalProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppPadding),
      child: Column(children: [
        const Expanded(
          child: CustomAppBarWidget(
            title: drawerApps,
            subTitle: appsSubTitle,
          ),
        ),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: GetBuilder<AppsController>(builder: (controller) {
                if (controller.isLoading) {
                  return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: kteal));
                } else {
                  return Column(
                      children:
                          List.generate(controller.allApps.length, (index) {
                    AppType type = AppType.values[index];
                    List<ClientApps> items = controller.allApps[type]!;
                    print(items);
                    return AppGrid(appCategory: type.toString(), apps: items);
                  }));
                }
              }),
            ))
      ]),
    )

        // child: TextButton(
        //   onPressed: () async {
        //     await LaunchApp.openApp(
        //       androidPackageName: 'dk.silverbullet.telemed',
        //       openStore: false
        //     );
        );
  }
}

class AppGrid extends StatelessWidget {
  AppGrid({required this.apps, super.key, required this.appCategory});
  final String appCategory;
  List<ClientApps> apps;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 3,
            color: Color.fromARGB(255, 223, 238, 222),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appCategory.split(".")[1].split("_").join(" "),
                  style: themeTextStyle(
                      fweight: FontWeight.w600, context: context),
                ),
                Tooltip(
                  message: 'Info',
                  child: IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      color: kdarkTeal,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 92.0 * (apps.length / 4).ceil(),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 4,
              ),
              itemCount: apps.length,
              itemBuilder: (context, index) {
                final data = apps[index];
                return AppCard(app: data);
              },
            ),
          ),
        ]));
  }
}

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.app});
  final ClientApps app;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (Platform.isIOS) {
          Get.to(DigiHealthApp());
        } else {
          if (app.isInstalled) {
            await LaunchApp.openApp(
                androidPackageName: app.packageName, openStore: false);
          } else {
            final controller = Get.find<AppsController>();
            controller.downloadFile("${app.appName}.apk");
          }
        }
      },
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Opacity(
              opacity: (app.isInstalled || Platform.isIOS) ? 1 : 0.4,
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    app.logo,
                    height: 30,
                    width: 30,
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              app.appName,
              style: themeTextStyle(
                context: context,
                fsize: 11,
                fweight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
