import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crossroad/common/widgets/icons/circular_icon.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:crossroad/common/widgets/texts/product_price_text.dart';
import 'package:crossroad/common/widgets/texts/product_title_text.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      width: 300,
      // height: 180, // Ensure the container has a consistent height
      decoration: BoxDecoration(
        // boxShadow: [AppShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkContainer : AppColors.white,
      ),
      child: Row(
        children: [
          //Thumbanil
          CircularContainer(
            height: 120,
            padding: EdgeInsets.all(AppSizes.sm),
            background: dark ? AppColors.darkGrey : AppColors.white,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: AppRoundedImage(
                    imageUrl: AppImageAsset.shoes3,
                    applyImageRaduis: true,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 3,
                  child: CircularContainer(
                    radius: AppSizes.sm,
                    background: AppColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm, vertical: AppSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: AppColors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )

          //Details
          ,
          SizedBox(
            width: 160,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.sm, left: AppSizes.sm),
                  child: Column(
                    children: [
                      ProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        maxLines: 2,
                        smallSize: true,
                      ),
                      SizedBox(
                        height: AppSizes.spaceBtwItem / 2,
                      ),
                      BrandTitleWithVerifiedIcon(title: 'Nike')
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ProductPriceText(
                        price: '272.0',
                        isLarge: false,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.cardRadiusMd),
                          bottomRight:
                              Radius.circular(AppSizes.productImageRadius),
                        ),
                      ),
                      child: const SizedBox(
                        width: AppSizes.iconLg * 1.2,
                        height: AppSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
