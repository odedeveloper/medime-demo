import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:InAppWebView(
            initialUrlRequest:URLRequest(url: Uri.parse("https://ode-oth.web.app/#/login")),
                        onLoadStart: (controller, url) {
                          print(url.toString());
                        },
                        onLoadStop: ((controller, url){
                          controller.injectJavascriptFileFromAsset(assetFilePath: "assets/js/token.js");
                        }),
                        androidOnPermissionRequest: (controller, origin, resources) async {
                          return PermissionRequestResponse(
                              resources: resources,
                              action: PermissionRequestResponseAction.GRANT);
                        },
                       

                        onConsoleMessage: (controller, consoleMessage) {
                          print(consoleMessage);
                        },
                      )
    );
  }
}
