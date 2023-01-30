import 'package:medical360_oth/exports.dart';

class MeasurementTypeCardWidget extends StatelessWidget {
  const MeasurementTypeCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => MeasurementTypeWidget(title: data!)),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kAppPadding),
          child: Row(
            children: [
              CircleAvatar(
                radius: kmediumFont(context)! + 15,
                backgroundColor: kbottomBoxColor,
                child: Image.asset(
                  appLogo,
                  height: ksmallFont(context)! + 15,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                data!,
                overflow: TextOverflow.ellipsis,
                style: themeTextStyle(
                  context: context,
                  fsize: klargeFont(context),
                  fweight: FontWeight.w700,
                  letterSpacing: 1.2,
                  tColor: ktextColor,
                  ovrflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
