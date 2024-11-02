import 'package:get/get.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  FlickManager? flickManager; // Use nullable type

  // Method to initialize FlickManager with a URL
  void initializeVideo(String url) {
    flickManager
        ?.dispose(); // Dispose of the previous FlickManager if it exists
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(url)),
    );
    update(); // Notify listeners about the update
  }

  @override
  void onClose() {
    // Dispose of the FlickManager when the controller is closed
    flickManager?.dispose();
    super.onClose();
  }
}
