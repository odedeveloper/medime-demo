import 'package:medical360_oth/exports.dart';

class AuthScreen extends GetWidget<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        if (Responsive.isDesktop(context)) const AuthLeftBoxWidget(),
        Expanded(
          flex: 3,
          child: Obx(
            () => controller.isLoginWidget.value
                ? const LoginWidget()
                : const SignUpWidget(),
          ),
        ),
      ]),
    );
  }
}
