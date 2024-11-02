// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class EpisodeModel {
  final String id;
  final String imageUrl;
  final String videoUrl;
  final String youtubeUrl;
  final String title;
  final String description;
  final String episodeDuration;
  final String speaker;
  final Timestamp? timestamp; // Add timestamp field

  EpisodeModel({
    required this.id,
    required this.imageUrl,
    required this.videoUrl,
    required this.youtubeUrl,
    required this.title,
    required this.description,
    required this.episodeDuration,
    required this.speaker,
    this.timestamp, // Include timestamp in the constructor
  });

  // Empty constructor
  static EpisodeModel empty() => EpisodeModel(
        id: '',
        imageUrl: '',
        videoUrl: '',
        youtubeUrl: '',
        title: '',
        description: '',
        episodeDuration: '',
        speaker: '',
        timestamp: null, // Set timestamp to null for the empty episode
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'youtubeUrl': youtubeUrl,
      'title': title,
      'description': description,
      'episodeDuration': episodeDuration,
      'speaker': speaker,
      'timestamp': timestamp, // Include timestamp in the JSON
    };
  }

  // Factory method to create an EpisodeModel from a Firebase document snapshot
  factory EpisodeModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return EpisodeModel(
        id: document.id, // Using the document's ID as the episode ID
        imageUrl: data['imageUrl'] ?? '',
        videoUrl: data['videoUrl'] ?? '',
        youtubeUrl: data['youtubeUrl'] ?? '',
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        episodeDuration: data['episodeDuration'] ?? '',
        speaker: data['speaker'] ?? '',
        timestamp:
            data['timestamp'], // Retrieve the timestamp from the document
      );
    } else {
      return EpisodeModel.empty();
    }
  }
}
