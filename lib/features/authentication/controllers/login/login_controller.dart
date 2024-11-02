import 'package:crossroad/bottom_nav_bar.dart';
import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/data/services/network_manager.dart';
import 'package:crossroad/features/authentication/screens/login/login.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //Variables
  final rememberNe = false.obs;
  final localStorage = GetStorage();
  final loading = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  //user controller
  final userController = Get.find<UserController>();
  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? "";
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? "";
    super.onInit();
  }

  Future<void> login() async {
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
        AppLoaders.customToast(message: 'No Internet connection!');
        return;
      }
      //validation
      if (!signupFormKey.currentState!.validate()) {
        loading.value = false;
        return;
      }
      //remember me
      if (rememberNe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //user login
      await AuthenticationRepository.instance
          .loginWithEmailAndPassWord(email.text.trim(), password.text.trim());

      AuthenticationRepository.instance.screenRedirect();
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

  Future<void> googleSignIn() async {
    try {
      //Start loading
      loading.value = true;

      // check internet connectivity
      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        loading.value = false;
        AppLoaders.customToast(message: 'No Internet connection!');
        return;
      }
      //Google auth
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      //save user
      await userController.saveUserRecord(userCredentials);

      //stop loader
      loading.value = false;
      // redirect user
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      loading.value = false;
      print('========================$e');
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
