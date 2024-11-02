// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerEffect extends StatelessWidget {
  const AppShimmerEffect({
    Key? key,
    this.radius = 15,
    required this.width,
    required this.height,
    this.color,
  }) : super(key: key);
  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? (dark ? AppColors.darkGrey : AppColors.white),
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
