import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical360_oth/exports.dart';

class SplashScreen extends GetWidget<SplachController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              medimeLogo,
              height: height(context)! * 0.2,
            ),
            const SizedBox(height: 20),
            Text(
              appTitle,
              style: themeTextStyle(
                context: context,
                fsize: kmaxExtraLargeFont(context),
                fweight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
