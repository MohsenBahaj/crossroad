import 'package:crossroad/features/authentication/controllers/forget_password/forget_password.dart';
import 'package:crossroad/features/authentication/screens/login/login.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              //Image with 60% of screen widdth
              //image
              Image(
                  width: AppHelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(AppImageAsset.onBoardingImageOne)),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              )
              // Title & subTitle
              ,
              Text(email,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSizes.spaceBtwItem),
              Text('password reset Email sent'.tr,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: AppSizes.spaceBtwItem),
              Text(
                  'Yout Account Security is Our Priority!. We\'ve Sent You a Secure Link to safely change your password and keep you account protected'
                      .tr,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: AppSizes.spaceBtwItem),

              // Buttons

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: Text('Done'.tr)),
              ),
              SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      ForgetPasswordController.instance
                          .resendPasswordResetEmail(email);
                    },
                    child: Text('resend_email'.tr)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
