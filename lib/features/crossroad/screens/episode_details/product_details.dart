import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/features/crossroad/screens/episode_details/widgets/episode_image.dart';
import 'package:crossroad/features/crossroad/screens/episode_details/widgets/episode_video_state.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class EpisodeDetailScreen extends StatelessWidget {
  const EpisodeDetailScreen(
      {super.key, required this.episode, this.isVideo = false});

  final EpisodeModel episode;
  final bool isVideo; // Optional parameter to handle video

  // Share episode function

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Check if it's a video or an image and render accordingly
            SizedBox(
              height: 250,
              child: VideoPlayerWidget(
                episodeUrl: episode.videoUrl,
              ),
            )
            // Handle video
            ,
            Padding(
              padding: const EdgeInsets.only(
                  left: AppSizes.defaultSpace,
                  right: AppSizes.defaultSpace,
                  bottom: AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    episode.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItem),
                  // Speaker
                  Text(
                    episode.speaker,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Description
                  ReadMoreText(
                    episode.description,
                    trimLines: 6,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    style: Theme.of(context).textTheme.bodyMedium,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItem),

                  // Watch on Youtube button

                  FutureBuilder<bool>(
                    future: controller.canlaunch(episode
                        .youtubeUrl), // Call the method to check if the URL can be launched
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: Center(
                              child:
                                  CircularProgressIndicator()), // Loading indicator while checking
                        );
                      } else if (snapshot.hasData && snapshot.data == true) {
                        // If the URL can be launched, display the button
                        return SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Launch the URL
                              AppHelperFunctions.launchURL(episode
                                  .youtubeUrl); // Ensure this method handles URL launching
                            },
                            label: Text('Watch on YouTube'),
                            icon: Icon(Iconsax
                                .video), // Ensure Iconsax is imported correctly
                          ),
                        );
                      } else {
                        // If the URL cannot be launched, return an empty container
                        return SizedBox.shrink(); // No button displayed
                      }
                    },
                  ),
                  SizedBox(height: AppSizes.spaceBtwItem),
                  Obx(
                    () => SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.shareLoading.value
                            ? () {}
                            : () async {
                                await controller.shareEpisode(
                                    episode); // Method to handle episode sharing
                              },
                        label: controller.shareLoading.value == true
                            ? Text('Loading ...')
                            : Text('Share'),
                        icon: controller.shareLoading.value
                            ? null
                            : Icon(Icons.share), // Share icon
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
