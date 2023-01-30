import 'package:medical360_oth/exports.dart';

class DashBoardController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  DashBoardController({
    required this.localRepositoryInterface,
    required this.apiRepositoryInterface,
  });

  List<Widget> dashboardScreens = [
    MedicalProviderScreen(),
    const MeasurementsScreen(),
    const HomeScreen(),
    const ConsentScreen(),
    const QuestionnairesScreen(),
    const RecordScreen(),
    PaymentScreen(),

  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  PageController _contentpageSelection = PageController(initialPage: 0);
  RxInt contentcurrentPageIndex = 0.obs;

  PageController get contentpageSelection {
    return _contentpageSelection;
  }

  set contentpageSelection(PageController i) {
    _contentpageSelection = i;
    update();
  }
}
