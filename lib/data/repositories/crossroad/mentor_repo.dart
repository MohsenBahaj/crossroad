import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossroad/features/crossroad/models/mentors_model.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MentorRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static MentorRepository get instance => Get.find<MentorRepository>();

  // Function to save a mentor to the database
  Future<void> saveMentorRecord(MentorModel mentor) async {
    try {
      await _db.collection('Mentors').doc(mentor.id).set(mentor.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Function to fetch a mentor based on their ID
  Future<MentorModel> fetchMentorRecord(String mentorId) async {
    try {
      final documentSnapshot =
          await _db.collection('Mentors').doc(mentorId).get();

      if (documentSnapshot.exists) {
        return MentorModel.fromSnapshot(documentSnapshot);
      } else {
        return MentorModel.empty();
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Update a mentor's data
  Future<void> updateMentorRecord(MentorModel updatedMentor) async {
    try {
      await _db
          .collection('Mentors')
          .doc(updatedMentor.id)
          .update(updatedMentor.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Remove a mentor from the database
  Future<void> removeMentorRecord(String mentorId) async {
    try {
      await _db.collection('Mentors').doc(mentorId).delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Upload an image for a mentor
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

  // Function to fetch all mentors
  Future<List<MentorModel>> fetchAllMentors() async {
    try {
      final querySnapshot = await _db.collection('Mentors').get();

      // If no documents are found, return an empty list
      if (querySnapshot.docs.isEmpty) {
        return []; // Returns an empty list
      }

      return querySnapshot.docs
          .map((doc) => MentorModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }
}
