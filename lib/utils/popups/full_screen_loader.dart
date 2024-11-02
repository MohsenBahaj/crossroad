import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:crossroad/utils/popups/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppHelperFunctions.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          body: Center(
            child: SingleChildScrollView(
              // Prevent overflow by making content scrollable
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Ensures Column only takes as much space as needed
                children: [
                  const SizedBox(
                    height: 250, // Adjust if needed
                  ),
                  AppAnimationLoaderWidget(
                    text: text,
                    animation: animation,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    if (Navigator.canPop(Get.overlayContext!)) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
