import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/products.cart/cart/cart_menu_icon.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/features/personalization/screens/profile/profile.dart';
import 'package:crossroad/features/crossroad/screens/cart/cart.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CrossRoads',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: AppHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black),
          ),
        ],
      ),
      action: [
        IconButton(
            onPressed: () => Get.to(() => ProfileScreen()),
            icon: Icon(Iconsax.user))
      ],
    );
  }
}
