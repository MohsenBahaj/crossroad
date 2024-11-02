import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        AppSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 2,
        ),
        Row(
          children: [
            CircularContainer(
              width: 60,
              height: 35,
              background: dark ? AppColors.light : AppColors.white,
              padding: EdgeInsets.all(AppSizes.sm),
              child: Image(image: AssetImage(AppImageAsset.google)),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItem / 2,
            ),
            Text(
              'Goolge pay',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
