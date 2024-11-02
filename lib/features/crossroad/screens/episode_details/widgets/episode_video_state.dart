import 'package:crossroad/features/crossroad/controllers/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String episodeUrl; // The URL of the episode to play

  const VideoPlayerWidget({Key? key, required this.episodeUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a unique tag for the controller based on the episode URL
    final String controllerTag = 'video_controller_$episodeUrl';

    // Get or create the VideoController instance
    final VideoController videoController =
        Get.put(VideoController(), tag: controllerTag);

    // Initialize the video with the provided URL
    videoController.initializeVideo(episodeUrl);

    return GetBuilder<VideoController>(
      tag: controllerTag, // Use the unique tag to differentiate instances
      builder: (controller) {
        if (controller.flickManager == null) {
          return Center(
              child:
                  CircularProgressIndicator()); // Show a loading indicator while the video is initializing
        }
        return Container(
          height: 250, // Set fixed height for video player container
          width: double.infinity,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(0), // Adjust border radius if needed
              child: FlickVideoPlayer(
                flickManager: controller.flickManager!,
                preferredDeviceOrientationFullscreen: [
                  DeviceOrientation.landscapeLeft,
                  DeviceOrientation.landscapeRight,
                ],
                systemUIOverlayFullscreen: [], // Hides system overlays in fullscreen
                wakelockEnabledFullscreen:
                    true, // Prevents screen from sleeping during fullscreen playback
              ),
            ),
          ),
        );
      },
    );
  }
}
