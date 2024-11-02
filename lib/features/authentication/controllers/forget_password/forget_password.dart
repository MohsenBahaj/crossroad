import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/data/services/network_manager.dart';
import 'package:crossroad/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send reset password email
  sendPasswordResetEmail() async {
    try {
      // check internet connectivity
      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        AppLoaders.customToast(message: 'No Internet connection!');
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }
      //send email to send reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      //show success
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password');

      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // check internet connectivity
      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        AppLoaders.customToast(message: 'No Internet connection!');
        return;
      }
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }
      //send email to send reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      //show success
      AppLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password');
    } catch (e) {
      AppLoaders.errorSnackbar(title: 'Oh snap!', message: e.toString());
    }
  }
}
