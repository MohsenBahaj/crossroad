import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossroad/features/crossroad/models/team_member.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TeamMemberRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static TeamMemberRepository get instance => Get.find<TeamMemberRepository>();

  // Function to save a team member to the database
  Future<void> saveTeamMemberRecord(TeamMemberModel teamMember) async {
    try {
      await _db
          .collection('TeamMembers')
          .doc(teamMember.id)
          .set(teamMember.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Function to fetch a team member based on their ID
  Future<TeamMemberModel> fetchTeamMemberRecord(String teamMemberId) async {
    try {
      final documentSnapshot =
          await _db.collection('TeamMembers').doc(teamMemberId).get();

      if (documentSnapshot.exists) {
        return TeamMemberModel.fromSnapshot(documentSnapshot);
      } else {
        return TeamMemberModel.empty();
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Update a team member's data
  Future<void> updateTeamMemberRecord(TeamMemberModel updatedTeamMember) async {
    try {
      await _db
          .collection('TeamMembers')
          .doc(updatedTeamMember.id)
          .update(updatedTeamMember.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Remove a team member from the database
  Future<void> removeTeamMemberRecord(String teamMemberId) async {
    try {
      await _db.collection('TeamMembers').doc(teamMemberId).delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Upload an image for a team member
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Function to fetch all team members
  Future<List<TeamMemberModel>> fetchAllTeamMembers() async {
    try {
      final querySnapshot = await _db.collection('Members').get();

      // If no documents are found, return an empty list
      if (querySnapshot.docs.isEmpty) {
        return []; // Returns an empty list
      }

      return querySnapshot.docs
          .map((doc) => TeamMemberModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }
}
