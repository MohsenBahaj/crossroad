import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EpisodeRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static EpisodeRepository get instance => Get.find<EpisodeRepository>();
  // Function to save an episode to the database
  Future<void> saveEpisodeRecord(EpisodeModel episode) async {
    try {
      await _db.collection('Episodes').doc(episode.id).set(episode.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Function to fetch an episode based on its ID
  Future<EpisodeModel> fetchEpisodeRecord(String episodeId) async {
    try {
      final documentSnapshot =
          await _db.collection('Episodes').doc(episodeId).get();

      if (documentSnapshot.exists) {
        return EpisodeModel.fromSnapshot(documentSnapshot);
      } else {
        return EpisodeModel.empty();
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Update an episode's data
  Future<void> updateEpisodeRecord(EpisodeModel updatedEpisode) async {
    try {
      await _db
          .collection('Episodes')
          .doc(updatedEpisode.id)
          .update(updatedEpisode.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Update a single field in an episode's data
  Future<void> updateSingleField(
      String episodeId, Map<String, dynamic> json) async {
    try {
      await _db.collection('Episodes').doc(episodeId).update(json);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Remove an episode from the database
  Future<void> removeEpisodeRecord(String episodeId) async {
    try {
      await _db.collection('Episodes').doc(episodeId).delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }

  // Upload an image for an episode (e.g., thumbnail)
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

  // Function to fetch all episodes
  Future<List<EpisodeModel>> fetchAllEpisodes() async {
    try {
      final querySnapshot = await _db
          .collection('Episodes')
          .orderBy('timestamp', descending: true)
          .get();

      // If no documents are found, return a list with an empty EpisodeModel
      if (querySnapshot.docs.isEmpty) {
        return [
          EpisodeModel.empty()
        ]; // Returns a list containing an empty EpisodeModel
      }

      return querySnapshot.docs
          .map((doc) => EpisodeModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again.";
    }
  }
}
