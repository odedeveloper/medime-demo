import 'package:medical360_oth/exports.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const CustomAppBarWidget({
    Key? key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title!,
          style: themeTextStyle(
            context: context,
            fsize: kmaxExtraLargeFont(context),
            fweight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subTitle!,
          style: themeTextStyle(
            context: context,
            ovrflow: TextOverflow.ellipsis,
            fsize: kmediumFont(context),
          ),
        )
      ],
    );
  }
}
