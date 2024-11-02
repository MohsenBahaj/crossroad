import 'package:crossroad/common/widgets/shimmers/shimmer.dart';
import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/features/personalization/screens/profile/widgets/edit_name.dart';
import 'package:crossroad/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : AppImageAsset.logoDark;
                      return controller.profileLoading.value
                          ? AppShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : AppRoundedImage(
                              imageUrl: image,
                              borderRadius: 100,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () {
                        controller.uploadImageProfilePicture();
                      },
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              const AppSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItem),
              ProfileMenu(
                showicon: true,
                onPressed: () {
                  Get.to(() => ChanegName());
                },
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              ProfileMenu(
                showicon: false,
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItem,
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              const AppSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: AppSizes.spaceBtwItem),
              ProfileMenu(
                icon: Iconsax.copy,
                onPressed: () {},
                title: 'User ID',
                showicon: false,
                value: controller.user.value.id,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                showicon: false,
                value: controller.user.value.email,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                showicon: false,
                value: controller.user.value.phoneNumber,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
                showicon: false,
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItem),
              TextButton(
                  onPressed: () => controller.deleteAccountWarringPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
