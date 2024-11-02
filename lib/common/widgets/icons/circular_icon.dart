import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = AppSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.radius = 36,
  });
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      width: width ?? 40,
      height: height ?? 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor
          // color: dark
          //     ? AppColors.black.withOpacity(0.5)
          //     : AppColors.white.withOpacity(0.5),
          ),
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
          )),
    );
  }
}
