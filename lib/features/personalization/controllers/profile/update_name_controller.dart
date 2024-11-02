import 'package:crossroad/common/widgets/loaders/app_loaders.dart';
import 'package:crossroad/data/repositories/user/user_repositry.dart';
import 'package:crossroad/data/services/network_manager.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/features/personalization/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final loading = false.obs;
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepositry = Get.find<UserRepositry>();
  GlobalKey<FormState> updateNameKey = GlobalKey<FormState>();

  @override
  onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  //fetch user record
  Future<void> updateUserName() async {
    try {
      //start loading
      loading.value = true;
      final isConnected = await NetworkManager.instance
          .isConnectedFunction(); // Form validation
      if (!isConnected) {
        loading.value = false;
        return;
      }
      //validation
      if (!updateNameKey.currentState!.validate()) {
        loading.value = false;
        return;
      }
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim(),
      };
      await userRepositry.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      loading.value = false;
      AppLoaders.successSnackBar(title: 'Your Name has been updated');
      Get.off(() => ProfileScreen());
    } catch (e) {
      loading.value = false;
      AppLoaders.errorSnackbar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
