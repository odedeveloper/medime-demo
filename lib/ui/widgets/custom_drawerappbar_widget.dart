import 'package:medical360_oth/exports.dart';

class CustomDrawerAppBar extends GetWidget<DashBoardController> {
  const CustomDrawerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        medimeLogo,
        height: 60,
      ),
      leading: !Responsive.isDesktop(context)
          ? IconButton(
              onPressed: controller.controlMenu,
              icon: const Icon(Icons.menu),
            )
          : null,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notification_important))
      ],
    );
  }
}
