import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/data/repositories/user/user_repositry.dart';
import 'package:crossroad/data/services/network_manager.dart';
import 'package:crossroad/features/authentication/models/user_model.dart';
import 'package:crossroad/features/authentication/screens/signup/verify_email.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:crossroad/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidePassword = true.obs;
  final loading = false.obs;
  final privacyCheckbox = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstNAme = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  //toggle password

  // SignUp
  Future<void> signup() async {
    try {
      loading.value = true;
      //Start loading
      // AppFullScreenLoader.openLoadingDialog(
      //     'We are processing your information...', AppImageAsset.logoDark);
      //check internet connectivity
      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        loading.value = false;
        return;
      }
      //validation
      if (!signupFormKey.currentState!.validate()) {
        loading.value = false;
        return;
      }
      //Privacy and policy
      if (!privacyCheckbox.value) {
        AppLoaders.warringSnackbar(
            title: 'Accept Privacy Policy',
            message:
                'In order to creat account , you must have to accept the Privacy & Terms of use.');
        return;
      }
      // Register user and save user in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // save auth user data in fire firebase firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstNAme.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      final userRepositry = Get.find<UserRepositry>();
      await userRepositry.saveUserRecord(newUser);
      //remobe loader
      // AppFullScreenLoader.stopLoading();
      //show success message
      AppLoaders.successSnackBar(
          title: 'Congratulatios',
          message: 'Your account has been created! Verify email to continue');
      // move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //show error
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
      //move to verify screen
    } finally {
      //Remove Loader
      // AppFullScreenLoader.stopLoading();
      loading.value = false;
    }
  }
}
