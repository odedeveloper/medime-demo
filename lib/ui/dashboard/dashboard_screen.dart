import 'package:medical360_oth/exports.dart';

class DashBoardScreen extends GetWidget<DashBoardController> {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      key: controller.scaffoldKey,
      appBar: !Responsive.isDesktop(context)
          ? const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomDrawerAppBar(),
            )
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(child: DrawerMenu()),
          Expanded(
            flex: 4,
            child: PageView(
              controller: controller.contentpageSelection,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.dashboardScreens,
            ),
          ),
        ],
      ),
    );
  }
}
