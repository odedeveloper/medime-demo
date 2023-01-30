import 'package:medical360_oth/exports.dart';

class AuthLeftBoxWidget extends StatelessWidget {
  const AuthLeftBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(kAppPadding),
        padding: const EdgeInsets.all(kAppPadding + 10),
        decoration: BoxDecoration(
          color: kteal,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: height(context)! * 0.07,
                backgroundColor: kbottomBoxColor,
                child: Image.asset(
                  appLogo,
                  height: height(context)! * 0.1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                appTitle,
                style: themeTextStyle(
                  context: context,
                  tColor: kwhite,
                  fontFamily: "Raleway",
                  fweight: FontWeight.w500,
                  letterSpacing: 1.2,
                  fsize: klargeFont(context),
                ),
              ),
              SizedBox(height: height(context)! * 0.1),
              Text(
                title,
                style: themeTextStyle(
                  context: context,
                  tColor: kwhite,
                  fontFamily: "Raleway",
                  fweight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fsize: kmaxExtraLargeFont(context)! + ksmallFont(context)!,
                ),
              ),
              SizedBox(height: height(context)! * 0.05),
              Text(
                subTitle,
                style: themeTextStyle(
                  context: context,
                  tColor: kwhite,
                  fontFamily: "Raleway",
                  letterSpacing: 1.2,
                  fsize: kmaxExtraLargeFont(context)!,
                ),
              ),
              SizedBox(height: height(context)! * 0.06),
              Container(
                padding: const EdgeInsets.all(kAppPadding + kAppPadding),
                decoration: BoxDecoration(
                  color: kbottomBoxColor,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                ),
                child: Text(
                  bottomInfo,
                  style: themeTextStyle(
                    context: context,
                    tColor: kwhite,
                    fontFamily: "Raleway",
                    fweight: FontWeight.w500,
                    letterSpacing: 1.2,
                    fsize: klargeFont(context)!,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
