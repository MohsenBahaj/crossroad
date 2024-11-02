// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:get/get.dart';
// import 'package:crossroad/features/crossroad/controllers/video_controller.dart';

// class MediaDisplay extends StatelessWidget {
//   final String url;
//   final bool isNetworkImage;

//   const MediaDisplay({
//     Key? key,
//     required this.url,
//     required this.isNetworkImage,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final VideoController videoController = Get.find<VideoController>();

//     // Initialize if it's a video and the controller is not initialized
//     if (!isNetworkImage ) {
//       videoController.initializeVideo(url);
//     }

//     return Obx(() {
//       if (isNetworkImage) {
//         return Container(
//           height: 200,
//           width: double.infinity,
//           child: Image.network(url, fit: BoxFit.cover),
//         );
//       } else if (videoController.isInitialized.value) {
//         return Container(
//           height: 200,
//           width: double.infinity,
//           child: AspectRatio(
//             aspectRatio:
//                 videoController.videoPlayerController.value!.value.aspectRatio,
//             child: VideoPlayer(videoController.videoPlayerController.value!),
//           ),
//         );
//       } else {
//         return Container(
//           height: 200,
//           color: Colors.black,
//           child: const Center(child: CircularProgressIndicator()),
//         );
//       }
//     });
//   }
// }
