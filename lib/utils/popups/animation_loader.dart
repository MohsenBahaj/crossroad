import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppAnimationLoaderWidget extends StatelessWidget {
  const AppAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.shoeAction = false,
      this.actionText,
      this.onActionPressed});
  final String text;
  final String animation;
  final bool shoeAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(
            height: AppSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: AppSizes.defaultSpace,
          ),
          shoeAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.dark),
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: AppColors.light),
                      )),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
