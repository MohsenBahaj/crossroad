import 'package:crossroad/common/widgets/shimmers/shimmer.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              AppShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),

              AppShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
