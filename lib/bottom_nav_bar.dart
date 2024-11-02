import 'package:crossroad/features/personalization/screens/settings/settings.dart';
import 'package:crossroad/features/crossroad/screens/home/home.dart';
import 'package:crossroad/features/crossroad/screens/browse/search.dart';
import 'package:crossroad/features/crossroad/screens/crossroadpage/crossroadpage.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = AppHelperFunctions.isDarkMode(context);

    return WillPopScope(
      onWillPop: () async {
        controller.onBackPressed(); // Call the onBackPressed method
        return false; // Prevent default back action
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            backgroundColor: dark ? AppColors.black : Colors.white,
            indicatorColor: dark
                ? Colors.white.withOpacity(0.1)
                : AppColors.black.withOpacity(0.1),
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.search_normal), label: 'Browse'),
              NavigationDestination(
                  icon: Icon(Iconsax.microphone), label: 'Crossroads'),
              NavigationDestination(
                  icon: Icon(Iconsax.setting_34), label: 'Settings'),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [
    HomeScreen(),
    Store(),
    CrossRoadsScreen(),
    SettingsScreen(),
  ];

  DateTime? lastBackPressed;

  // Manage back press behavior
  void onBackPressed() {
    if (selectedIndex.value != 0) {
      selectedIndex.value = 0; // Go back to Home tab
    } else {
      if (lastBackPressed == null ||
          DateTime.now().difference(lastBackPressed!) > Duration(seconds: 2)) {
        lastBackPressed = DateTime.now();
        // Optional snackbar to inform the user
      } else {
        SystemNavigator.pop(); // Exit the app
      }
    }
  }
}
