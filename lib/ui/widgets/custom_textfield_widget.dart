import 'package:medical360_oth/exports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final bool? showObsureEye;
  final bool? showErrorText;
  final String? errorText;
  final VoidCallback? onObsureClicked;
  final bool? showSuffixIcon;
  final Function(String)? onChanged;
  const CustomTextField({
    Key? key,
    this.controller,
    this.onObsureClicked,
    this.showErrorText = false,
    this.showObsureEye = true,
    this.showSuffixIcon = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius - 4),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        hintText: hintText,
        hintStyle: themeTextStyle(
          context: context,
          fweight: FontWeight.w400,
        ),
        suffixIcon: showSuffixIcon!
            ? IconButton(
                onPressed: onObsureClicked!,
                icon: Icon(
                    showObsureEye! ? Icons.visibility_off : Icons.visibility),
              )
            : null,
        errorText: showErrorText!
            ? errorText
            : errorText == ""
                ? null
                : errorText,
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }
}
