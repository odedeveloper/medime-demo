import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:medical360_oth/exports.dart';

class AuthController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  AuthController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  final RegExp _passwordRegExp = RegExp(
    r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$",
  );

  HeadlessInAppWebView? headlessWebView;
  String url = "";

  @override
  void onInit() {
    super.onInit();
    // getHeadlessView();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    // headlessWebView?.dispose();
    super.dispose();
  }

  Timer? _debounce;
  RxBool showPasswordEye = true.obs;
  RxBool showSignUpPasswordEye = true.obs;
  RxBool showSignUpConfirmPasswordEye = true.obs;
  RxBool isLoginWidget = true.obs;
  RxBool authLoader = false.obs;
  RxBool authSignupLoader = false.obs;
  RxBool showSignupusernameErrorText = false.obs;
  RxString signupUsernameErrorText = "".obs;
  RxBool showSignupPasswordError = false.obs;
  RxString signupPasswordErrorText = "".obs;
  RxString deviceUniqueIdText = "".obs;

  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signUpUsernameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController signUpUniqueCodeController = TextEditingController();

  void changeLoginState(bool isLogin) {
    loginUsernameController.clear();
    loginPasswordController.clear();
    signUpUsernameController.clear();
    signUpPasswordController.clear();
    signUpConfirmPasswordController.clear();
    signUpUniqueCodeController.clear();
    if (isLogin) {
      isLoginWidget(true);
    } else {
      isLoginWidget(false);
    }
  }

  chechConfirmPassworkMatch() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (signUpPasswordController.text ==
          signUpConfirmPasswordController.text) {
        signupPasswordErrorText("");
        showSignupPasswordError(false);
      } else {
        signupPasswordErrorText('Password not match');
        showSignupPasswordError(true);
      }
      update();
    });
  }

  Future<MethodResponse> verifyLogInRequest() async {
    if (isLoginWidget.value && loginUsernameController.text.isEmpty ||
        !isLoginWidget.value && signUpUsernameController.text.isEmpty) {
      return MethodResponse(
        errorMessage: enterEmailProceed,
        errorDescription: "Username/Email Feild should not be empty!",
      );
    }
    if (isLoginWidget.value &&
            loginUsernameController.text.contains("@") &&
            !_emailRegExp.hasMatch(loginUsernameController.text) ||
        !isLoginWidget.value &&
            signUpUsernameController.text.contains("@") &&
            !_emailRegExp.hasMatch(signUpUsernameController.text)) {
      return MethodResponse(
        errorMessage: validEmail,
        errorDescription: "Entered email is not appropriate",
      );
    }

    if (isLoginWidget.value && loginPasswordController.text.isEmpty ||
        !isLoginWidget.value && signUpPasswordController.text.isEmpty ||
        !isLoginWidget.value && signUpConfirmPasswordController.text.isEmpty) {
      return MethodResponse(
        errorMessage: enterPassword,
        errorDescription: "Password Feild should not be empty!",
      );
    }
    if (!isLoginWidget.value && signUpUniqueCodeController.text.isEmpty) {
      return MethodResponse(
        errorMessage: "Please enter a code",
        errorDescription: "UniqueCode Feild should not be empty!",
      );
    }
    if (isLoginWidget.value && loginPasswordController.text.length < 8 ||
        !isLoginWidget.value && signUpPasswordController.text.length < 8 ||
        !isLoginWidget.value &&
            signUpConfirmPasswordController.text.length < 8) {
      return MethodResponse(
        errorMessage: "Password is too short",
        errorDescription: "Password at least 8 characters long!",
      );
    }
    // if (isLoginWidget.value &&
    //         !_passwordRegExp.hasMatch(loginPasswordController.text) ||
    //     !isLoginWidget.value &&
    //         !_passwordRegExp.hasMatch(signUpPasswordController.text) ||
    //     !isLoginWidget.value &&
    //         !_passwordRegExp.hasMatch(signUpConfirmPasswordController.text)) {
    //   return MethodResponse(
    //     errorMessage: "Please enter a strong password",
    //     errorDescription:
    //         "Minimum eight characters, at least one letter, one number and one special character",
    //   );
    // }
    return MethodResponse(isSuccess: true);
  }

  Future callMethodChannedForDeviceId() async {
    const deviceIdChannel = MethodChannel("com.MediMe/DeviceIdInfo");
    final String deviceIdResult =
        await deviceIdChannel.invokeMethod("getDeviceId");
    deviceUniqueIdText(deviceIdResult);
  }

  Future<bool> login() async {
    try {
      authLoader(true);
      String? emaildata;
      ApiResults result = await apiRepositoryInterface
          .getPrimaryCall(loginUsernameController.text);
      if (result is ApiSuccess) {
        if (result.data["status"] == "success") {
          emaildata = result.data["username"];

          // need to wirte the api call to store device id for oth..
          // deviceUniqueIdText contain
          //--------------------------------------------------------

          bool isUserValid = await apiRepositoryInterface.login(
              emaildata!, loginPasswordController.text);
          authLoader(false);
          // await webLoginToOth(
          //     loginUsernameController.text, loginPasswordController.text);
          return isUserValid;
        } else {
          authLoader(false);
          Get.snackbar(
            margin: const EdgeInsets.all(kAppPadding),
            result.statusCode.toString(),
            result.data["message"],
            colorText: kwhite,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.error, color: kwhite),
          );
          return false;
        }
      } else {
        authLoader(false);
        if (result is ApiFailure) {
          Get.snackbar(
            margin: const EdgeInsets.all(kAppPadding),
            result.message,
            "",
            colorText: kwhite,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.error, color: kwhite),
          );
        }
        return false;
      }
    } on CognitoClientException catch (e) {
      authLoader(false);

      if (e.code == 'NetworkError') {
        Get.snackbar(
          margin: const EdgeInsets.all(kAppPadding),
          internetNotAvailable,
          "Please check your Internet connection.",
          colorText: kwhite,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: kwhite),
        );
      } else {
        Get.snackbar(
          margin: const EdgeInsets.all(kAppPadding),
          e.message!,
          "",
          colorText: kwhite,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: kwhite),
        );
      }

      rethrow;
    } catch (e) {
      authLoader(false);
      rethrow;
    }
  }

  Future verifyUserName() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      ApiResults result = await apiRepositoryInterface.checkUsernameUnique(
          username: signUpUsernameController.text);
      if (result is ApiSuccess) {
        if (result.data["status"] == "error") {
          showSignupusernameErrorText(true);
          signupUsernameErrorText(result.data["message"]);
        } else {
          showSignupusernameErrorText(false);
          signupUsernameErrorText("");
          log(" succ ${result.data["status"]}");
        }
      } else if (result is ApiFailure) {
        showSignupusernameErrorText(true);
        signupUsernameErrorText(result.message);
      }
    });
  }

  Future<bool> signup() async {
    authSignupLoader(true);
    ApiResults result = await apiRepositoryInterface.confirmAccountService(
      email: "ajay118@yopmail.com",
      username: signUpUsernameController.text,
      newPassword: signUpConfirmPasswordController.text,
      oldPassword: signUpUniqueCodeController.text,
    );

    if (result is ApiSuccess) {
      if (result.data["status"] == "success") {
        authSignupLoader(false);
        return true;
      } else {
        authSignupLoader(false);
        Get.snackbar(
          margin: const EdgeInsets.all(kAppPadding),
          result.data["statusCode"].toString(),
          result.data["body"],
          colorText: kwhite,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: kwhite),
        );
        return false;
      }
    } else {
      authSignupLoader(false);
      if (result is ApiFailure) {
        Get.snackbar(
          margin: const EdgeInsets.all(kAppPadding),
          result.message,
          result.message,
          colorText: kwhite,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.error, color: kwhite),
        );
      }

      return false;
    }
  }

  webLoginToOth(String username, String password) async {
    String source = "add($username,$password)";
    await headlessWebView!.webViewController.evaluateJavascript(source: source);
  }

  getHeadlessView() async {
    headlessWebView = HeadlessInAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://ode-oth.web.app/#/login")),
        onWebViewCreated: (controller) {},
        onConsoleMessage: (controller, consoleMessage) {},
        onLoadStart: (controller, url) async {
          print(url);
        },
        onLoadStop: (controller, url) async {
          controller.injectJavascriptFileFromAsset(
              assetFilePath: 'assets/js/logging.js');
        });
    await headlessWebView?.run();
  }
}
