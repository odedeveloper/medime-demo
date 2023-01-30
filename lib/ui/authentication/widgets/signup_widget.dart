

import 'package:medical360_oth/exports.dart';

class SignUpWidget extends GetWidget<AuthController> {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context)
              ? kAppPadding * 18
              : kAppPadding * 2,
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
                  "Sign Up",
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
                        text: "Have an account ? ",
                      ),
                      TextSpan(
                        style: themeTextStyle(
                          context: context,
                          fsize: klargeFont(context),
                          fweight: FontWeight.w600,
                          tColor: kteal,
                        ),
                        text: "Login",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            controller.isLoginWidget(true);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
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
                  controller: controller.signUpUsernameController,
                  hintText: "Enter Username",
                  showErrorText: controller.showSignupusernameErrorText.value,
                  errorText: controller.signupUsernameErrorText.value,
                  onChanged: (p0) {
                    controller.verifyUserName();
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Password",
                  style: themeTextStyle(
                    context: context,
                    letterSpacing: 1.2,
                    fsize: klargeFont(context),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: controller.signUpPasswordController,
                  hintText: "Enter Password",
                  obscureText: controller.showSignUpPasswordEye.value,
                  showSuffixIcon: true,
                  showObsureEye: controller.showSignUpPasswordEye.value,
                  onObsureClicked: () {
                    controller.showSignUpPasswordEye(
                        !controller.showSignUpPasswordEye.value);
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Confirm Password",
                  style: themeTextStyle(
                    context: context,
                    letterSpacing: 1.2,
                    fsize: klargeFont(context),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: controller.signUpConfirmPasswordController,
                  hintText: "Re-enter Password",
                  obscureText: controller.showSignUpConfirmPasswordEye.value,
                  showSuffixIcon: true,
                  showObsureEye: controller.showSignUpConfirmPasswordEye.value,
                  onObsureClicked: () {
                    controller.showSignUpConfirmPasswordEye(
                        !controller.showSignUpConfirmPasswordEye.value);
                  },
                  showErrorText: controller.showSignupPasswordError.value,
                  errorText: controller.signupPasswordErrorText.value,
                  onChanged: (p0) {
                    controller.chechConfirmPassworkMatch();
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "Unique Code",
                  style: themeTextStyle(
                    context: context,
                    letterSpacing: 1.2,
                    fsize: klargeFont(context),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: controller.signUpUniqueCodeController,
                  hintText: "Enter code",
                ),
                const SizedBox(height: 50),
                controller.authSignupLoader.value
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
                            bool isValid = await controller.signup();
                            if (isValid) {
                              // ignore: use_build_context_synchronously
                              showSuccessDialog(context);
                            }
                          } else {
                            Get.snackbar(
                              margin: const EdgeInsets.all(kAppPadding),
                              result.errorMessage!,
                              result.errorDescription!,
                              colorText: kwhite,
                              backgroundColor: Colors.red,
                              icon: const Icon(
                                Icons.error,
                                color: kwhite,
                              ),
                            );
                          }
                        },
                        title: "Sign Up",
                      ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSuccessDialog(BuildContext context) async {
    showGeneralDialog(
      // barrierDismissible: false,
      context: context,
      barrierColor: Colors.black54, // space around dialog
      transitionDuration: const Duration(milliseconds: 800),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
              parent: a1,
              curve: Curves.elasticOut,
              reverseCurve: Curves.easeOutCubic),
          child: CustomDialog(
              popAction: null,
              showIconCircle: false,
              title: "Password Reset Successful!",
              contentTextAlign: TextAlign.start,
              content:
                  "You have successfully reset the password for your account.",
              positiveBtnText: "Ok",
              negativeBtnText: "",
              positiveBtnPressed: () {
                Navigator.pop(context);
                controller.changeLoginState(true);
              }),
        );
      },
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return const SizedBox.shrink();
      },
    );
  }
}
