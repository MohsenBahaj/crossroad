import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "View all",
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        showActionButton
            ? TextButton(onPressed: onPressed, child: Text(buttonTitle))
            : Container()
      ],
    );
  }
}
