import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String? imgPath;
  final double? width;
  final double? height;
  final Color? color;
  const SvgIconWidget({
    Key? key,
    this.imgPath,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imgPath!,
      width: width,
      height: height,
      color: color,
    );
  }
}
