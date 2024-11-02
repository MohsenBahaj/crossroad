// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:crossroad/utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.icon = Iconsax.arrow_right_34,
    this.onPressed,
    required this.value,
    required this.showicon,
    required this.title,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final String title, value;
  final bool showicon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItem / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            showicon
                ? Expanded(
                    child: Icon(
                    icon,
                  ))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
