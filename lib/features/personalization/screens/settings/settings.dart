import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:crossroad/common/widgets/list_tiles.dart/settings_menu_tile.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/common/widgets/list_tiles.dart/user_list_tile.dart';
import 'package:crossroad/data/repositories/authentication/authentication_repo.dart';
import 'package:crossroad/features/personalization/screens/address/address.dart';
import 'package:crossroad/features/personalization/screens/profile/profile.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationRepository>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            AppPrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    showBackArrow: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),

                  //user Profile card
                  UserProfileTile(
                    onPressed: () {
                      Get.to(() => const ProfileScreen());
                    },
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const AppSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem,
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.moon,
                    title: 'Dark Mode',
                    subTitle: 'set dark mode',
                    trailing: Switch(
                        value: AppHelperFunctions.isDarkMode(context),
                        onChanged: (value) {
                          Get.changeThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light,
                          );
                        }),
                    onTap: () {
                      Get.changeThemeMode(
                        AppHelperFunctions.isDarkMode(context)
                            ? ThemeMode.light
                            : ThemeMode.dark,
                      );
                    },
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.call,
                    title: 'Contact us',
                    subTitle: 'feel free to ask any question',
                    onTap: () {
                      AppHelperFunctions.launchURL(
                          'https://wa.me/919063850784');
                    },
                  ),
                  AppSettingMenuTile(
                    icon: Iconsax.code,
                    title: 'Meet the Developer',
                    subTitle: 'Connecting ideas with the world',
                    onTap: () {
                      AppHelperFunctions.launchURL(
                          'https://mohsen-51063.web.app/');
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.spaceBtwItem,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: Text('Logout'.tr),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
