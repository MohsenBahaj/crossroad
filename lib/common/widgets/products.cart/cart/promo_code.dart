import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppCouponCode extends StatelessWidget {
  const AppCouponCode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CircularContainer(
      showBorder: true,
      background: dark ? AppColors.dark : AppColors.white,
      padding: EdgeInsets.only(
          top: AppSizes.sm,
          bottom: AppSizes.sm,
          right: AppSizes.sm,
          left: AppSizes.md),
      child: Row(
        children: [
          //Text Field
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1))),
            child: const Text('Apply'),
          )
        ],
      ),
    );
  }
}
