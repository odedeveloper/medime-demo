import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical360_oth/exports.dart';

class MobTabAuthHeader extends StatelessWidget {
  const MobTabAuthHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            medimeLogo,
            height: height(context)! * 0.2,
          ),
          Text(
            appTitle,
            style: themeTextStyle(
              context: context,
              tColor: kdarkTeal,
              fontFamily: "Raleway",
              fweight: FontWeight.w900,
              letterSpacing: 1.2,
              fsize: klargeFont(context),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: themeTextStyle(
              context: context,
              tColor: kblack,
              fontFamily: "Raleway",
              fweight: FontWeight.bold,
              letterSpacing: 1.2,
              fsize: klargeFont(context),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
