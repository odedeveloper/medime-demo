import 'package:medical360_oth/exports.dart';

class LoginWidget extends GetWidget<AuthController> {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal:
            Responsive.isDesktop(context) ? kAppPadding * 18 : kAppPadding * 2,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              if (!Responsive.isDesktop(context)) const MobTabAuthHeader(),
              Text(
                "Login",
                style: themeTextStyle(
                  context: context,
                  fweight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fsize: kmaxExtraLargeFont(context)! + ksmallFont(context)!,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: themeTextStyle(
                        context: context,
                        fsize: klargeFont(context),
                      ),
                      text: "Don't have an account ? ",
                    ),
                    TextSpan(
                      style: themeTextStyle(
                        context: context,
                        fsize: klargeFont(context),
                        fweight: FontWeight.w600,
                        tColor: kteal,
                      ),
                      text: "SignUp",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          controller.changeLoginState(false);
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Username",
                style: themeTextStyle(
                  context: context,
                  letterSpacing: 1.2,
                  fsize: klargeFont(context),
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: controller.loginUsernameController,
                hintText: "Enter Username/Email",
              ),
              const SizedBox(height: 30),
              Text(
                "Password",
                style: themeTextStyle(
                  context: context,
                  letterSpacing: 1.2,
                  fsize: klargeFont(context),
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => CustomTextField(
                  controller: controller.loginPasswordController,
                  hintText: "Enter Password",
                  obscureText: controller.showPasswordEye.value,
                  showSuffixIcon: true,
                  showObsureEye: controller.showPasswordEye.value,
                  onObsureClicked: () {
                    controller
                        .showPasswordEye(!controller.showPasswordEye.value);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: kteal,
                  ),
                  Text(
                    "Remember me",
                    style: themeTextStyle(
                      context: context,
                      letterSpacing: 1.2,
                      fweight: FontWeight.w300,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Reset Password ?",
                    style: themeTextStyle(
                      context: context,
                      fweight: FontWeight.bold,
                      letterSpacing: 1.2,
                      tColor: kteal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Obx(
                () => controller.authLoader.value
                    ? const SpinKitThreeBounce(
                        size: 25,
                        duration: Duration(milliseconds: 800),
                        color: Colors.grey,
                      )
                    : CustomTextElevatedButton(
                        onClicked: () async {
                          MethodResponse result =
                              await controller.verifyLogInRequest();
                          if (result.isSuccess!) {
                            bool isValid = await controller.login();
                            if (isValid) {
                              Get.offNamed(AppRoutes.dashBoard);
                            } else {}
                          } else {
                            Get.snackbar(
                              margin: const EdgeInsets.all(kAppPadding),
                              result.errorMessage!,
                              result.errorDescription!,
                              colorText: kwhite,
                              backgroundColor: Colors.red,
                              icon: const Icon(Icons.error, color: kwhite),
                            );
                          }
                        },
                        title: "Sign In",
                      ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
