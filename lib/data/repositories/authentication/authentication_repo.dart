import 'package:crossroad/bottom_nav_bar.dart';
import 'package:crossroad/data/repositories/user/user_repositry.dart';
import 'package:crossroad/features/authentication/screens/login/login.dart';
import 'package:crossroad/features/authentication/screens/onboarding/onboarding.dart';
import 'package:crossroad/features/authentication/screens/signup/verify_email.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/utils/exceptions/firbase_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get form main.dart on app lunch
  User? get authUser => _auth.currentUser;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  /*----------------------------------Email & Password sign-in---------------------------------*/
  //Login
  Future<UserCredential> loginWithEmailAndPassWord(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  // register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  //forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  // re auth user
  Future<void> reAuth(String email, String password) async {
    try {
      AuthCredential crediential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(crediential);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  //mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }
  //forget passworrd

  /*------------------------------social sign-in ---------------*/
  //Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAcount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAcount?.authentication;

      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await FirebaseAuth.instance.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }
  //Facebook

  /* -----------------------end Federated identity & social sign-in*/
  //Log out valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }

  //remove user auth and firebase
  Future<void> deleteAccount() async {
    try {
      await UserRepositry.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(code: e.code).message;
    } catch (e) {
      throw "something went Wrong ,plz try agian";
    }
  }
}
