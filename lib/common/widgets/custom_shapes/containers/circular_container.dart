import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color borderColor;
  final bool showBorder;
  final Color background;

  const CircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = AppSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.background = AppColors.white,
    this.margin,
    this.borderColor = AppColors.borderPrimary,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
