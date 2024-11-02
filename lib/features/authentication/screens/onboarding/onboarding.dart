import 'package:crossroad/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:crossroad/features/authentication/screens/onboarding/widgets/onboarding_nav_indicator.dart';
import 'package:crossroad/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:crossroad/features/authentication/screens/onboarding/widgets/onboarding_page_widget.dart';
import 'package:crossroad/features/authentication/screens/onboarding/widgets/onboardingskip.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPageWidget(
                title: 'onboarding.choose_product_title',
                subTitle: 'onboarding.choose_product_body',
                image: AppImageAsset.onBoardingImageOne,
              ),
              onBoardingPageWidget(
                title: 'onboarding.easy_payment_title',
                subTitle: 'onboarding.choose_product_body',
                image: AppImageAsset.onBoardingImageTwo,
              ),
              onBoardingPageWidget(
                title: 'onboarding.fast_delivery_title',
                subTitle: 'onboarding.fast_delivery_body',
                image: AppImageAsset.onBoardingImageThree,
              ),
            ],
          )

          //skip button
          ,
          const OnBoardingSkip()

          //dot navigation smoothPageindicator
          ,
          const OnBoardingNavIndicator()
          //Circular button
          ,
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
