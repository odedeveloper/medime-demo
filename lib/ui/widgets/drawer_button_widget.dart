import 'package:medical360_oth/exports.dart';

class DrawerButtons extends GetWidget<DashBoardController> {
  final VoidCallback? onClicked;
  final String? title;
  final IconData? icon;
  final int? pageIndex;
  const DrawerButtons({
    Key? key,
    this.icon,
    this.pageIndex,
    this.title,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        borderRadius: BorderRadius.circular(kBorderRadius),
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: controller.contentcurrentPageIndex.value == pageIndex
                ? kteal
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: kmaxExtraLargeFont(context),
                  color: controller.contentcurrentPageIndex.value == pageIndex
                      ? kwhite
                      : null,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Text(
                    title!,
                    style: themeTextStyle(
                      context: context,
                      fweight:
                          controller.contentcurrentPageIndex.value == pageIndex
                              ? FontWeight.bold
                              : null,
                      tColor:
                          controller.contentcurrentPageIndex.value == pageIndex
                              ? kwhite
                              : ktextColor,
                      fsize: klargeFont(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
