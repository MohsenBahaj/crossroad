import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/product_description.dart';
import 'package:crossroad/features/crossroad/controllers/team_member_controller.dart';
import 'package:crossroad/features/crossroad/models/episode_model.dart';
import 'package:crossroad/features/crossroad/models/team_member.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.member,
  });
  final TeamMemberModel member;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHelperFunctions.launchURL(member.linkedinUrl);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppHelperFunctions.isDarkMode(context)
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 270,
        width: AppDeviceUtility.getScreenWidth(context) -
            AppSizes.defaultSpace -
            40,
        padding: EdgeInsets.all(0),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: AppSizes.spaceBtwItem),
                alignment: Alignment.center,
                child: AppRoundedImage(
                  height: 150,
                  width: 150,
                  isNetworkImage: true,
                  borderRadius: 100,
                  radius: 100,
                  imageUrl: member.photo,
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      member.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItem / 2),
                    Text(
                      member.bio,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItem / 2),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
