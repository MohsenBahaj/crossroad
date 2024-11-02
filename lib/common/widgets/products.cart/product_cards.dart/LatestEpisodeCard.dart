import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/product_description.dart';
import 'package:crossroad/common/widgets/texts/product_title_text.dart';
import 'package:crossroad/common/widgets/video_display/video_display_widget.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/features/crossroad/screens/episode_details/product_details.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestEpisodeCard extends StatelessWidget {
  const LatestEpisodeCard({super.key, required this.episode});
  final EpisodeModel episode;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        // Navigate to the details page and pass the video URL
        Get.to(() => EpisodeDetailScreen(
              episode: episode,
              isVideo: true,
            ));
      },
      child: Container(
        width: AppDeviceUtility.getScreenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.xs),
          color: dark ? Colors.black : AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Display video thumbnail (image) instead of playing the video
                AppRoundedImage(
                    height: 250,
                    radius: 0,
                    width: double.infinity,
                    applyImageRaduis: false,
                    isNetworkImage: true,
                    imageUrl: episode.imageUrl),
                // Video Duration Display
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      episode
                          .episodeDuration, // Assuming you have a duration property in your model
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Product details: Title, Description
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
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
          ],
        ),
      ),
    );
  }
}

// Widget to display video thumbnail
class VideoThumbnailWidget extends StatelessWidget {
  final String videoUrl;

  const VideoThumbnailWidget({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.xs),
        image: DecorationImage(
          image: NetworkImage(videoUrl), // Use the image URL for thumbnail
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
