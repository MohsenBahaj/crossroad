import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/enums.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.color,
    required this.title,
    this.maxLine = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final Color? color;
  final String title;
  final int maxLine;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: brandTextSize == TextSizes.small
                ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
                : brandTextSize == TextSizes.medium
                    ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                    : brandTextSize == TextSizes.large
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .apply(color: color)
                        : Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: color),
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLine,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        const Icon(
          Iconsax.verify5,
          color: AppColors.primary,
          size: AppSizes.iconXS,
        ),
      ],
    );
  }
}
