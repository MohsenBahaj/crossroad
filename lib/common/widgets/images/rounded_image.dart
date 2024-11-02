import 'package:cached_network_image/cached_network_image.dart';
import 'package:crossroad/common/widgets/shimmers/shimmer.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppRoundedImage extends StatelessWidget {
  const AppRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRaduis = true,
    this.border,
    this.topRadius = false,
    this.bakcgroundColor = AppColors.light,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = AppSizes.md,
    this.overlayColor,
    this.radius = 55,
  });

  final double? width, height;
  final bool topRadius;
  final String imageUrl;
  final bool applyImageRaduis;
  final BoxBorder? border;
  final Color bakcgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    print("Building AppRoundedImage with imageUrl: $imageUrl");
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: bakcgroundColor, // Ensure a background color is set
        ),
        child: ClipRRect(
          borderRadius: applyImageRaduis
              ? topRadius
                  ? BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius))
                  : BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: ClipRRect(
            borderRadius: applyImageRaduis
                ? topRadius
                    ? BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius))
                    : BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: fit,
                    color: overlayColor,
                    progressIndicatorBuilder: (context, url, progress) =>
                        AppShimmerEffect(
                      width: 55,
                      radius: radius,
                      height: 55,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    fit: fit,
                  ),
          ),
        ),
      ),
    );
  }
}
