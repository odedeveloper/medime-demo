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
            Responsive.isDesktop(context) ? kAppPadding * 20 : kAppPadding * 2,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isDesktop(context))
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          tColor: kblack,
                          fontFamily: "Raleway",
                          fweight: FontWeight.w500,
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
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
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
                      text: "Register with unique code",
                      recognizer: TapGestureRecognizer()..onTap = () async {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Email",
                style: themeTextStyle(
                  context: context,
                  letterSpacing: 1.2,
                  fsize: klargeFont(context),
                ),
              ),
              const SizedBox(height: 10),
              const CustomTextField(
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
              const SizedBox(height: 30),
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
                      fsize: 10,
                      tColor: kteal,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomTextElevatedButton(
                onClicked: () {},
                title: "Sign In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
