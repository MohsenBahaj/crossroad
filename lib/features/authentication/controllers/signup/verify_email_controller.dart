import 'dart:async';

import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:crossroad/common/widgets/success_screens/success_screen.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/features/authentication/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send Email wehnever verify screen appear & send timer for autoo redirecr.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verifyfication link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AppLoaders.successSnackBar(
          title: "Email Sent",
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      AppLoaders.errorSnackbar(title: "oh Snap!", message: e.toString());
    }
  }

  // timer to automatically redirect
  setTimerForAutoRedirect() async {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            title: 'Email Verified!',
            subTitle:
                'Your email has been successfully verified. You can now log in.',
            buttonText: 'Login Now',
            onPressed: () {
              // Navigate to the login screen
              AuthenticationRepository.instance.screenRedirect();
            }));
      }
    });
  }

  //manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          title: 'Email Verified!',
          subTitle:
              'Your email has been successfully verified. You can now log in.',
          buttonText: 'Login Now',
          onPressed: () {
            // Navigate to the login screen
            Get.off(() => AuthenticationRepository.instance.screenRedirect());
          }));
    }
  }
}
