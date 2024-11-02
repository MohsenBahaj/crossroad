import 'package:crossroad/common/widgets/layouts/grid_layout.dart';
import 'package:crossroad/common/widgets/products.cart/product_cards.dart/LatestEpisodeCard.dart';
import 'package:crossroad/common/widgets/products.cart/product_cards.dart/normalepisodecard.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/features/crossroad/screens/home/widgets/home_app_bar.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<HomeController>();

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: dark ? Colors.black : Colors.white,
          child: Column(
            children: [
              // Header
              HomeAppBar(),

              // Your latest recommendation
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.defaultSpace),
                      child: AppSectionHeading(
                        title: 'Your latest recommendation',
                        showActionButton: false,
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),
                    Obx(() {
                      if (controller.episodesList.isEmpty) {
                        return CircularProgressIndicator(); // Add loading indicator for the first episode
                      } else {
                        return LatestEpisodeCard(
                            episode: controller.episodesList[0]);
                      }
                    }),
                    const SizedBox(height: AppSizes.spaceBtwItem),
                  ],
                ),
              ),

              // More recommendations
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    AppSectionHeading(
                      title: 'More recommendations',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: 300,
                      child: Obx(() {
                        if (controller.episodesList.length < 2) {
                          return SizedBox(); // Show nothing if less than 2 episodes
                        }
                        return GridLayout(
                          itemCount: controller.episodesList.length < 5
                              ? controller.episodesList.length -
                                  1 // Exclude the first episode
                              : 4,
                          itemBuilder: (_, index) {
                            return NormalEpisodeCard(
                                episode: controller.episodesList[
                                    index + 1]); // +1 to skip the first episode
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // Newest Talk
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
                child: Column(
                  children: [
                    AppSectionHeading(
                      title: 'Newest Talk',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: 300,
                      child: Obx(() {
                        if (controller.episodesList.isEmpty) {
                          return CircularProgressIndicator(); // Add loading indicator
                        }
                        return GridLayout(
                          itemCount: controller.episodesList.length - 1,
                          itemBuilder: (_, index) {
                            return NormalEpisodeCard(
                                episode: controller.episodesList[index + 1]);
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
