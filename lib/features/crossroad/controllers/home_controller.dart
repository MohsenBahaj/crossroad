import 'dart:io';

import 'package:crossroad/data/repositories/episode/episoderepo.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final Rx<int> carouselCurrentIndex = 0.obs;
  final Rx<bool> shareLoading = false.obs;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  // List of all episodes
  final RxList<EpisodeModel> episodesList = <EpisodeModel>[].obs;

  // List for filtered episodes based on search
  var filteredEpisodes = <EpisodeModel>[].obs;

  // Repository instance for fetching episodes
  final EpisodeRepository _episodeRepo = EpisodeRepository.instance;

  // TextEditingController for the search input
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllEpisodes();

    // Adding a listener to the search controller
    searchController.addListener(_filterEpisodes);
  }

//share episode
  Future<void> shareEpisode(EpisodeModel episode) async {
    try {
      shareLoading.value = true;
      // Download the image
      final response = await Dio().get(
        episode.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // Get the temporary directory to save the image
      final tempDir = await getTemporaryDirectory();
      final filePath =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      // Write the image file
      final file = File(filePath);
      await file.writeAsBytes(response.data);

      // Create an XFile from the downloaded image
      final xFile = XFile(filePath);

      // Prepare the share message
      final String message = '''
 Cross Roads with Shazin
🎙 Title: ${episode.title}
🗣 Speaker: ${episode.speaker}
⏳ Duration: ${episode.episodeDuration}
📜 Description: ${episode.description}
🔗 Watch here: ${episode.youtubeUrl}

Crossroad App developed by Mohsen Bahaj
🌐 https://mohsen-51063.web.app/
''';

      // Share the image and text
      await Share.shareXFiles([xFile], text: message);
      shareLoading.value = false;
    } catch (e) {
      // Handle error
      print("Error sharing episode: $e");
    }
  }

//url check
  Future<bool> canlaunch(String uri) async {
    if (await canLaunchUrl(Uri.parse(uri))) {
      return true;
    } else {
      return false;
    }
  }

  // Function to fetch all episodes
  Future<void> fetchAllEpisodes() async {
    try {
      final episodes = await _episodeRepo.fetchAllEpisodes();
      episodesList.assignAll(episodes);
      filteredEpisodes.assignAll(episodesList); // Initialize with all episodes
    } catch (e) {
      print("Error fetching episodes: $e");
    }
  }

  // Function to filter episodes based on search query
  void _filterEpisodes() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      // If the search query is empty, show all episodes
      filteredEpisodes.assignAll(episodesList);
    } else {
      // Filter the episodes list based on the query
      filteredEpisodes.assignAll(
        episodesList.where((episode) =>
            episode.title.toLowerCase().contains(query) ||
            episode.speaker.toLowerCase().contains(query)),
      );
    }
  }
}
