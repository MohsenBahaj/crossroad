import 'package:crossroad/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/device/device_utility.dart';

class OnBoardingNavIndicator extends StatelessWidget {
  const OnBoardingNavIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = AppHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: AppDeviceUtility.getBottomNavigationBarHieght() + 25,
        left: AppSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? AppColors.light : AppColors.dark,
              dotHeight: 6),
        ));
  }
}
