import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

//The reasot to create this class is that we need to add backgeorund to the tab bar but is is not accept normal widget it nneed widget with preffredSizesWisget   @mohsen bahaj 2024
class AppBarTab extends StatelessWidget implements PreferredSizeWidget {
  const AppBarTab({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: dark ? AppColors.white : AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtility.getAppBarHeight());
}
