import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:crossroad/common/widgets/products.cart/cart/cart_item.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<HomeController>();

    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            showBackArrow: false,
            title: Text(
              'All videos',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                // Styled search text field
                Container(
                  child: TextField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search by title or speaker',
                      hintStyle: TextStyle(color: AppColors.grey),
                      prefixIcon: Icon(Icons.search, color: AppColors.grey),
                    ),
                    style: TextStyle(
                        color: dark ? AppColors.white : AppColors.black),
                  ),
                ),
                SizedBox(
                  height: AppSizes.spaceBtwSections,
                ),
                Expanded(
                  // Add Expanded to make the ListView take available space
                  child: Obx(() => ListView.separated(
                        separatorBuilder: (_, __) => SizedBox(
                          height: AppSizes.spaceBtwItem,
                        ),
                        itemCount: controller.filteredEpisodes.length,
                        itemBuilder: (context, index) {
                          return EpisodeSearchCard(
                            episode: controller.filteredEpisodes[index],
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
