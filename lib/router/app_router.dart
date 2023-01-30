import 'package:medical360_oth/exports.dart';
import 'package:medical360_oth/ui/dashboard/medical_provider_screen/apps_binding.dart';

class AppRoutes {
  static const String splash = "/splash";
  static const String auth = "/auth";
  static const String dashBoard = "/dashBoard";
  static const String home = "/home";
  static const String consent = "/consent";
  static const String medicalProvider = "/medicalProvider";
  static const String records = "/records";
  static const String payment = "/payment";
  static const String measurements = "/measurements";
  static const String questionnaires = "/questionnaires";
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      bindings: [MainBinding(), SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.auth,
      page: () => const AuthScreen(),
      bindings: [MainBinding(), AuthBinding()],
    ),
    GetPage(
      name: AppRoutes.dashBoard,
      page: () => const DashBoardScreen(),
      bindings: [
        MainBinding(),
        DashBoardBinging(),
        MeasurementsBinding(),
        QuestionariesBinding(),
        AppsBinding(),
      ],
    ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeScreen(),
    //   binding: DashBoardBinging(),
    // ),
    // GetPage(
    //   name: AppRoutes.consent,
    //   page: () => const ConsentScreen(),
    //   binding: DashBoardBinging(),
    // ),
    // GetPage(
    //   name: AppRoutes.medicalProvider,
    //   page: () => const MedicalProviderScreen(),
    //   binding: DashBoardBinging(),
    // ),
    // GetPage(
    //   name: AppRoutes.records,
    //   page: () => const RecordScreen(),
    //   binding: DashBoardBinging(),
    // ),
    // GetPage(
    //   name: AppRoutes.payment,
    //   page: () => const PaymentScreen(),
    //   binding: DashBoardBinging(),
    // ),
    // GetPage(
    //   name: AppRoutes.measurements,
    //   page: () => const MeasurementsScreen(),
    //   binding: MeasurementsBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.questionnaires,
    //   page: () => const QuestionnairesScreen(),
    //   binding: DashBoardBinging(),
    // ),
  ];
}
