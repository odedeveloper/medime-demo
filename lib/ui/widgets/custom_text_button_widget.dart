import 'package:medical360_oth/exports.dart';

class CustomTextElevatedButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onClicked;
  const CustomTextElevatedButton({super.key, this.onClicked, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClicked!,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kteal),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kAppPadding),
          child: Text(
            title!,
            style: themeTextStyle(
              context: context,
              fsize: klargeFont(context),
              tColor: kwhite,
            ),
          ),
        ),
      ),
    );
  }
}
