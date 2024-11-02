import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crossroad/common/widgets/icons/circular_icon.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:crossroad/common/widgets/texts/product_price_text.dart';
import 'package:crossroad/common/widgets/texts/product_description.dart';
import 'package:crossroad/common/widgets/texts/product_title_text.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/features/crossroad/screens/episode_details/product_details.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NormalEpisodeCard extends StatelessWidget {
  const NormalEpisodeCard({super.key, required this.episode});
  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(EpisodeDetailScreen(
          episode: episode,
        ));
      },
      child: Container(
        width: AppDeviceUtility.getScreenWidth(context),
        // height: 180, // Ensure the container has a consistent height
        decoration: BoxDecoration(
          // boxShadow: [AppShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.xs),
          color: dark ? Colors.black : AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail, Wishlist button, Discount tag
            CircularContainer(
              radius: AppSizes.cardRadiusLg,
              background: dark ? Colors.black : AppColors.light,
              height: 160,
              child: Stack(
                children: [
                  AppRoundedImage(
                    borderRadius: AppSizes.cardRadiusXs,
                    height: 160,
                    width: double.infinity,
                    radius: 0,
                    isNetworkImage: true,
                    imageUrl: episode.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    child: CircularContainer(
                      width: 40,
                      radius: 2,
                      background: AppColors.black.withOpacity(0.7),
                      padding: EdgeInsets.all(2),
                      child: Text(
                        episode.episodeDuration,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: AppColors.white,
                            ),
                      ),
                    ),
                  ),
                  //fav icon
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.spaceBtwItem,
            ),
            // Product details: Title, Description, Brand
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: episode.title,
                  ),
                  ProductDescriptionText(
                    title: episode.description,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem / 2,
                  ),
                ],
              ),
            ),

            // Price and Add to Cart
          ],
        ),
      ),
    );
  }
}
