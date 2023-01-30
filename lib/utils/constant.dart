import 'package:flutter/material.dart';

const double kAppPadding = 15.0;
const double kBorderRadius = 12.0;
const Color kblack = Colors.black;
const Color kwhite = Colors.white;
const Color kdarkTeal = Color(0xff297D6B);
const Color kteal = Color(0xff40AB94);
const Color kmediumTeal = Color.fromARGB(255, 239, 255, 252);
const Color klightTeal = Color(0xffBCF0E5);
const Color kextraLightTeal = Color(0xffF1FEFB);
const Color kbottomBoxColor = Color(0xFF287e6b);
const Color ktextColor = Color(0xff4a4a4a);

const String folderActive = "assets/images/folder_active.png";
const String folderInactive = "assets/images/folder_inactive.png";
const String enterprise = "assets/images/company.png";
const String payment = "assets/images/wallet.png";
const String dashboard = "assets/images/dashboard.png";
const String consent = "assets/images/consent.png";
const String appLogo = "assets/images/app-logo.svg";
const String logo = "assets/images/logo.png";
const String medimeLogo = "assets/images/medime_logo.png";
const String tele1 = "assets/images/telemedicine.png";
const String tele2 = "assets/images/medical-app.png";
const String tele3 = "assets/images/medical-app_1.png";
const String tele4 = "assets/images/doctor.png";

const String insurance1 = "assets/images/health-insurance.png";
const String insurance2 = "assets/images/family.png";

const String record1 = "assets/images/medical-record.png";

const String pharmacy1 = "assets/images/pharmacy.png";
const String pharmacy2 = "assets/images/drugs.png";

const String quickSand = 'Quicksand';
const String ralewayFont = 'Raleway';

const String bottomInfo =
    "Get provider info and medical records from all sources any place any time";
const String subTitle =
    "Relax as we cover all your medical records and medical claims.";
const String title = "Maintain your Medical healthcare with us.";

const String drawerHome = "Home";
const String drawerConsent = "Consent";
const String drawerMedicalProvider = "Medical Provider";
const String drawerRecords = "Records";
const String drawerPayment = "Payment";
const String drawerMeasurements = "Measurements";
const String drawerQuestionnaires = "Questionnaires";
const String drawerApps = "MedicalCare";

const String appTitle = "Medical 360";
const String documents = "Documents";
const String dataShared = "Data Shared";
const String history = "History";
const String loading = "Loading";
const String manageData = "Manage what data you want to share";

const String measurementSubTitle = "Here are all your measurements.";
const String questionnariesSubTitle =
    "You can start any of the given questionnaries";
const String appsSubTitle =
    "Here you can access all the integrated apps , as well download them.";
const String addProviders = "Add New Providers";
const String currentProviders = "Current Providers";
const String splashText = "Medical 360";

const String enterPassword = "Please enter password.";
const String enterEmailProceed = "Please enter Username/Email to proceed.";
const String validEmail = "Please enter valid email.";

const String unknowErrorOccurr = "Unknown error occurred";
const String userUnAuthorise = "User is unauthorised.";
const String internetNotAvailable = "Network Not Available";

const String addCurrentMedication =
    'Please list any medications that you are now taking. Include non-prescription medications & vitamins or supplements:';

const String medicalHistory = 'Did you ever have?';
const String medicalConditions = 'Other medical conditions (please list):';
const String systemReview =
    'In the past month, have you had any of the following problems?';

const String balance = 'Balance';
const String pendingPayments = 'Pending Payments';
const String paymentMethods = 'Payment Methods';

themeTextStyle({
  context,
  double? letterSpacing,
  String? fontFamily,
  double? fsize,
  FontWeight? fweight,
  Color? tColor,
  TextOverflow? ovrflow = TextOverflow.ellipsis,
}) =>
    TextStyle(
      color: tColor ?? Theme.of(context).primaryColor,
      letterSpacing: letterSpacing ?? 1.2,
      fontFamily: fontFamily ?? ralewayFont,
      fontSize:
          fsize != null ? fontSize(context)! * fsize : kmediumFont(context),
      //  overflow: overf ?? ovrflow,
      fontWeight: fweight,
    );

double? height(BuildContext context) {
  double? size = MediaQuery.of(context).size.height;
  return size;
}

double? width(BuildContext context) {
  double? size = MediaQuery.of(context).size.width;
  return size;
}

double? fontSize(BuildContext context) {
  // final scale = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.3);
  double? size = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.0);
  return size;
}

double? kminiFont(BuildContext context) {
  double? size = fontSize(context)! * 12;
  return size;
}

double? ksmallFont(BuildContext context) {
  double? size = fontSize(context)! * 14;
  return size;
}

double? kmediumFont(BuildContext context) {
  double? size = fontSize(context)! * 16;
  return size;
}

double? klargeFont(BuildContext context) {
  double? size = fontSize(context)! * 18;
  return size;
}

double? kextraLargeFont(BuildContext context) {
  double? size = fontSize(context)! * 20;
  return size;
}

double? kmaxExtraLargeFont(BuildContext context) {
  double? size = fontSize(context)! * 22;
  return size;
}
