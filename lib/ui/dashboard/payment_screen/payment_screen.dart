import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_storage/get_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Coming soon"),),)
              // body: Stack(
              //   alignment: Alignment.bottomCenter,
              //   children: [
              //     InAppWebView(
              //     initialOptions: InAppWebViewGroupOptions(
              //     crossPlatform: InAppWebViewOptions(
              //     cacheEnabled: true,
              //     clearCache: false,
              //     javaScriptEnabled: true,
              //     )),
              //     initialUrlRequest:
              //       URLRequest(url: Uri.parse("https://ode-oth.web.app/#/login")),
              //     onLoadStart: (controller, url) async {
              //       String? deviceId = await PlatformDeviceId.getDeviceId;
              //       await controller.injectJavascriptFileFromAsset(
              //       assetFilePath: "assets/js/token.js");
              //       print("$deviceId");
              //       String source = "device('$deviceId')";
              //       controller.evaluateJavascript(source: source);
              //     },
              //     onLoadStop: (controller, url) async {
              //       String? deviceId = await PlatformDeviceId.getDeviceId;
              //       await controller.injectJavascriptFileFromAsset(
              //       assetFilePath: "assets/js/token.js");
              //       print("$deviceId");
              //       String source = "device('$deviceId')";
              //       controller.evaluateJavascript(source: source);
              //     },
              //             //   controller.injectJavascriptFileFromAsset(
              //             //       assetFilePath: "assets/js/token.js");
              //             //       String coding = "";
              //             //       String source = "addToken($)";
              //             //         controller.evaluateJavascript(source: source)
              //             // }),
              //     androidOnPermissionRequest: (controller, origin, resources) async {
              //       return PermissionRequestResponse(
              //         resources: resources,
              //         action: PermissionRequestResponseAction.GRANT);
              //     },
              //     onConsoleMessage: (controller, consoleMessage) {
              //       print(consoleMessage);
              //     },
              //   ),
              //   TextButton(
              //     onPressed: (){
              //       Get.back();
              //     }, 
              //     child: const Text("Go back"))
              //   ]
              // )
          // ),
    );
  }
}
// 