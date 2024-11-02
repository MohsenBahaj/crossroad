// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crossroad/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  final void Function()? onPressed;
  const OnBoardingSkip({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: AppSizes.defaultSpace,
        top: AppDeviceUtility.getAppBarHeight(),
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: Text('skip'.tr)));
  }
}
