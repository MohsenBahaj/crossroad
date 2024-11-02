import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/features/authentication/controllers/login/login_controller.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () async {
                await controller.googleSignIn();
              },
              icon: const Image(
                  height: AppSizes.iconMd,
                  width: AppSizes.iconMd,
                  image: AssetImage(AppImageAsset.google))),
        ),
        const SizedBox(
          width: AppSizes.spaceBtwItem,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  height: AppSizes.iconMd,
                  width: AppSizes.iconMd,
                  image: AssetImage(AppImageAsset.facebook))),
        ),
      ],
    );
  }
}
