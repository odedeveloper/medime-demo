import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical360_oth/exports.dart';

class DrawerMenu extends GetWidget<DashBoardController> {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onAddButtonTapped(int index) {
      controller.contentpageSelection.jumpToPage(index);
      controller.contentcurrentPageIndex(index);
    }

    return SafeArea(
      child: Drawer(
        elevation: 20,
        backgroundColor: klightTeal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    medimeLogo,
                    height: kextraLargeFont(context)! + 80,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    appTitle,
                    style: themeTextStyle(
                      context: context,
                      ovrflow: TextOverflow.ellipsis,
                      tColor: kdarkTeal,
                      fontFamily: "Raleway",
                      fweight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fsize: kextraLargeFont(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              DrawerButtons(
                title: drawerApps,
                icon: Icons.medical_services,
                pageIndex: 0,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(0);
                },
              ),
              DrawerButtons(
                title: drawerMeasurements,
                icon: Icons.health_and_safety,
                pageIndex: 1,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(1);
                },
              ),
              DrawerButtons(
                title: drawerHome,
                pageIndex: 2,
                icon: Icons.home_sharp,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(2);
                },
              ),
              DrawerButtons(
                title: drawerConsent,
                icon: Icons.edit_note,
                pageIndex: 3,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(3);
                },
              ),
              DrawerButtons(
                title: drawerMedicalProvider,
                icon: Icons.medication_liquid_sharp,
                pageIndex: 4,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(4);
                },
              ),
              DrawerButtons(
                title: drawerRecords,
                icon: Icons.recent_actors_rounded,
                pageIndex: 5,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(5);
                },
              ),
              DrawerButtons(
                title: drawerPayment,
                icon: Icons.wallet,
                pageIndex: 6,
                onClicked: () {
                  if (!Responsive.isDesktop(context)) Navigator.pop(context);
                  onAddButtonTapped(6);
                },
              ),
              const SizedBox(height: 20),
              Spacer(),
              // CircleAvatar(
              //   radius: height(context)! * 0.08,
              //   backgroundColor: kbottomBoxColor,
              // ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ODE K",
                    style: themeTextStyle(
                      context: context,
                      tColor: kdarkTeal,
                      fontFamily: "Raleway",
                      fweight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fsize: kextraLargeFont(context),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "medical360@yopmail.com",
                    style: themeTextStyle(
                      context: context,
                      tColor: kdarkTeal,
                      fontFamily: "Raleway",
                      fweight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.help,
                      size: height(context)! * 0.03,
                      color: kdarkTeal,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      size: height(context)! * 0.03,
                      color: kdarkTeal,
                    ),
                    onPressed: () async {
                      GetStorage deviceStorage = GetStorage();
                      await deviceStorage.erase();
                      Get.offAllNamed(AppRoutes.splash);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
