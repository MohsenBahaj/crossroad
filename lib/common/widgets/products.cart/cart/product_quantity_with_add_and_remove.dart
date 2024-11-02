import 'package:crossroad/common/widgets/icons/circular_icon.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityWithAddAndRemove extends StatelessWidget {
  const ProductQuantityWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: AppSizes.md,
          color: AppHelperFunctions.isDarkMode(context)
              ? AppColors.white
              : AppColors.black,
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.darkGrey
              : AppColors.light,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem / 1.5,
        ),
        const CircularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppColors.white,
            backgroundColor: AppColors.primary),
      ],
    );
  }
}
