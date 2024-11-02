import 'package:cloud_firestore/cloud_firestore.dart';

class MentorModel {
  final String id; // Unique ID for the mentor
  final String imageUrl; // URL for the mentor's image
  final String name; // Mentor's name
  final String bio; // Short biography of the mentor
  final String description; // Detailed description of the mentor
  final String linkedinUrl; // Link to the mentor's LinkedIn profile

  MentorModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.bio,
    required this.description,
    required this.linkedinUrl,
  });

  // Empty constructor for creating a MentorModel instance with default values
  static MentorModel empty() => MentorModel(
        id: '',
        imageUrl: '',
        name: '',
        bio: '',
        description: '',
        linkedinUrl: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'bio': bio,
      'description': description,
      'linkedinUrl': linkedinUrl,
    };
  }

  // Factory method to create a MentorModel from a Firebase document snapshot
  factory MentorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return MentorModel(
        id: document.id, // Using the document's ID as the mentor ID
        imageUrl: data['imageUrl'] ?? '',
        name: data['name'] ?? '',
        bio: data['bio'] ?? '',
        description: data['description'] ?? '',
        linkedinUrl: data['linkedinUrl'] ?? '',
      );
    } else {
      return MentorModel.empty();
    }
  }
}
