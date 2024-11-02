// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crossroad/features/crossroad/screens/episode_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import 'package:crossroad/common/widgets/icons/circular_icon.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/brandTitleWithVerify.dart';
import 'package:crossroad/common/widgets/texts/product_title_text.dart';
import 'package:crossroad/features/crossroad/controllers/home_controller.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';

class EpisodeSearchCard extends StatelessWidget {
  const EpisodeSearchCard({
    Key? key,
    required this.episode,
  }) : super(key: key);
  final EpisodeModel episode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EpisodeDetailScreen(episode: episode));
      },
      child: Row(
        children: [
          AppRoundedImage(
              width: 130,
              padding: EdgeInsets.all(AppSizes.sm),
              height: 80,
              radius: 0,
              imageUrl: episode.imageUrl,
              isNetworkImage: true,
              fit: BoxFit.cover,
              borderRadius: 4),
          const SizedBox(
            width: AppSizes.spaceBtwItem,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ProductTitleText(
                    title: episode.title,
                    maxLines: 1,
                  ),
                ),
                Flexible(
                  child: ProductTitleText(
                    title: episode.speaker,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
