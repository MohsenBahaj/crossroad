import 'package:crossroad/common/styles/spacing_style.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.image,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      required this.onPressed});
  final String? image;
  final String title;
  final String subTitle;
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //image
              Image(
                  width: AppHelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(AppImageAsset.logoDark)),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              )
              // Title & subTitle
              ,
              Text(title.tr, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwItem),
              Text(subTitle.tr,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItem),

              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: Text(buttonText.tr)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
