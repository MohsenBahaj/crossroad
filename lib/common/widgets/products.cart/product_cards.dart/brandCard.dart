import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/enums.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
  });
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('brand tapped');
      },
      child: CircularContainer(
        padding: const EdgeInsets.all(AppSizes.sm),
        showBorder: showBorder,
        background: Colors.transparent,
        child: Row(
          children: [
            AppRoundedImage(
              height: 46,
              borderRadius: AppSizes.md,
              imageUrl: AppImageAsset.logoDark,
              isNetworkImage: false,
              bakcgroundColor: Colors.transparent,
              overlayColor: AppHelperFunctions.isDarkMode(context)
                  ? AppColors.white
                  : AppColors.white,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BrandTitleWithVerifiedIcon(
                      title: 'Nike ', brandTextSize: TextSizes.large),
                  Text(
                    '25 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
