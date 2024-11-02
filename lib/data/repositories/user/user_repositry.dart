import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/features/authentication/models/user_model.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepositry extends GetxController {
  static UserRepositry get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
//function to save user database
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

//function to fetch user details based on user id
  Future<UserModel> fetchUserRecord() async {
    try {
      final uid = AuthenticationRepository.instance.authUser!.uid;
      print('Fetching user data for UID: $uid');

      final documentSnapshot = await _db.collection('Users').doc(uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        print('User document does not exist for UID: $uid'); // Log
        return UserModel.empty();
      }
    } catch (e) {
      print('Exception: $e'); // Log the exact exception
      throw "Something went wrong, please try again.";
    }
  }

  //update user data
  Future<void> updateUserRecord(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  //update any field of user data
  //update user data
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  //Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }
}
