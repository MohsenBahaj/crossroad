import 'package:crossroad/app.dart';
import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/common/widgets/curved_edge/curved_edge_widget.dart';
import 'package:crossroad/common/widgets/icons/circular_icon.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class EpisodeDetailImageSlider extends StatelessWidget {
  const EpisodeDetailImageSlider({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomClipPath(
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              child: AppRoundedImage(
                height: 300,
                width: double.infinity,
                imageUrl: imageUrl,
                isNetworkImage: true,
                radius: 0,
                applyImageRaduis: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
