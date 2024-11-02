import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppSearchContainer extends StatelessWidget {
  const AppSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBorder = true,
    this.showBackground = true,
    this.padding =
        const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });
  final String text;
  final EdgeInsetsGeometry padding;
  final IconData? icon;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        height: 50,
        width: AppDeviceUtility.getScreenWidth(context),
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? AppColors.dark
                    : AppColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
            border: showBorder ? Border.all(color: AppColors.grey) : null),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Text(
              'Search',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
