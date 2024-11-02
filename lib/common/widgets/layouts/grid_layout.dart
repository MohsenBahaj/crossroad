import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        // physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: AppSizes.gridViewSpacing,
            crossAxisSpacing: AppSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent,
            crossAxisCount: 1),
        itemBuilder: itemBuilder);
  }
}
