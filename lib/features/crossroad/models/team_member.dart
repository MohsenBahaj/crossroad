import 'package:cloud_firestore/cloud_firestore.dart';

class TeamMemberModel {
  final String id; // Unique ID for the team member
  final String name; // Team member's name
  final String bio; // Short biography of the team member
  final String photo; // URL for the team member's photo
  final String linkedinUrl; // Link to the team member's LinkedIn profile

  TeamMemberModel({
    required this.id,
    required this.name,
    required this.bio,
    required this.photo,
    required this.linkedinUrl,
  });

  // Empty constructor for creating a TeamMemberModel instance with default values
  static TeamMemberModel empty() => TeamMemberModel(
        id: '',
        name: '',
        bio: '',
        photo: '',
        linkedinUrl: '',
      );

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'photo': photo,
      'linkedinUrl': linkedinUrl,
    };
  }

  // Factory method to create a TeamMemberModel from a Firebase document snapshot
  factory TeamMemberModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return TeamMemberModel(
        id: document.id, // Using the document's ID as the team member ID
        name: data['name'] ?? '',
        bio: data['bio'] ?? '',
        photo: data['photo'] ?? '',
        linkedinUrl: data['linkedinUrl'] ?? '',
      );
    } else {
      return TeamMemberModel.empty();
    }
  }
}
