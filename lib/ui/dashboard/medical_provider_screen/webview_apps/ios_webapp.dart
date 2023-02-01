import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medical360_oth/ui/widgets/custom_text_button_widget.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:get/get.dart';
import 'package:medical360_oth/exports.dart';

class DigiHealthApp extends StatefulWidget {
  DigiHealthApp({super.key});

  @override
  State<DigiHealthApp> createState() => _DigiHealthAppState();
}

class _DigiHealthAppState extends State<DigiHealthApp> {
  bool isbackButonVisible = false;
  final String mainuRL = "https://ode-oth.web.app/#/menu";
  final String webAppUrl = "https://ode-oth.web.app/#/login";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(alignment: Alignment.bottomCenter, children: [
        InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
            cacheEnabled: true,
            clearCache: false,
            javaScriptEnabled: true,
          )),
          initialUrlRequest: URLRequest(url: Uri.parse(webAppUrl)),
          onLoadStart: (controller, url) async {
            String? deviceId = await PlatformDeviceId.getDeviceId;
            await controller.injectJavascriptFileFromAsset(
                assetFilePath: "assets/js/token.js");
            print("$deviceId");
            String source = "device('$deviceId')";
            controller.evaluateJavascript(source: source);
          },
          onLoadStop: (controller, url) async {
            print(url);
            String? deviceId = await PlatformDeviceId.getDeviceId;
            await controller.injectJavascriptFileFromAsset(
                assetFilePath: "assets/js/token.js");
            print("$deviceId");
            String source = "device('$deviceId')";
            controller.evaluateJavascript(source: source);
            if (url.toString() == mainuRL) {
              setState(() {
                isbackButonVisible = true;
              });
            } else {
              setState(() {
                isbackButonVisible = false;
              });
            }
          },
          //   controller.injectJavascriptFileFromAsset(
          //       assetFilePath: "assets/js/token.js");
          //       String coding = "";
          //       String source = "addToken($)";
          //         controller.evaluateJavascript(source: source)
          // }),
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage);
          },
        ),
        // if (isbackButonVisible)
        //   Container(
        //     margin: EdgeInsets.only(bottom: 30),
        //     child: SizedBox(
        //       width: 200,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         style: ButtonStyle(
        //           backgroundColor: MaterialStateProperty.all<Color>(kteal),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(kAppPadding),
        //           child: Text(
        //             "Go back",
        //             style: themeTextStyle(
        //               context: context,
        //               fsize: klargeFont(context),
        //               tColor: kwhite,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
      ])),
    );
  }
}
//
