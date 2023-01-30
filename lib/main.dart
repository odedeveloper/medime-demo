import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'exports.dart';
import 'package:platform_device_id/platform_device_id.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

  //   var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
  //       AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
  //   var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
  //       AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

  //   if (swAvailable && swInterceptAvailable) {
  //     AndroidServiceWorkerController serviceWorkerController =
  //         AndroidServiceWorkerController.instance();

  //     await serviceWorkerController
  //         .setServiceWorkerClient(AndroidServiceWorkerClient(
  //       shouldInterceptRequest: (request) async {
  //         print(request);
  //         return null;
  //       },
  //     ));
  //   }
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medical-360',
      theme: MyThemeData.lightTheme,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
    );
  }
}
