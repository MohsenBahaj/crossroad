import 'package:crossroad/common/widgets/shimmers/shimmer.dart';
import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image =
            networkImage.isNotEmpty ? networkImage : AppImageAsset.logoDark;
        return controller.profileLoading.value
            ? AppShimmerEffect(
                width: 80,
                height: 80,
                radius: 80,
              )
            : SizedBox(
                width: 55,
                height: 80,
                child: AppRoundedImage(
                  imageUrl: image,
                  borderRadius: 60,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 80,
                  isNetworkImage: networkImage.isNotEmpty,
                ),
              );
      }),
      title: Obx(
        () => Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      subtitle: Obx(
        () => Text(
          controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
        ),
        color: AppColors.white,
      ),
    );
  }
}
