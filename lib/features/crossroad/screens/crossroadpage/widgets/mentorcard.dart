import 'package:crossroad/common/widgets/images/rounded_image.dart';
import 'package:crossroad/common/widgets/texts/product_description.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/image_string.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/device/device_utility.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  const MentorCard(
      {super.key,
      required this.name,
      required this.bio,
      required this.desc,
      required this.linkedinUrl,
      required this.imageUrl});
  final String name;
  final String bio;
  final String desc;
  final String linkedinUrl;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHelperFunctions.launchURL(linkedinUrl);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItem),
        decoration: BoxDecoration(
          color: AppHelperFunctions.isDarkMode(context)
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 450,
        width: AppDeviceUtility.getScreenWidth(context) -
            AppSizes.defaultSpace -
            40,
        padding: EdgeInsets.all(0),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: AppRoundedImage(
                  isNetworkImage: true,
                  height: 250,
                  width: double.infinity,
                  radius: 0,
                  imageUrl: imageUrl,
                  topRadius: true,
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItem / 2),
                    Text(
                      bio,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: AppSizes.spaceBtwItem / 2),
                    ProductDescriptionText(maxLines: 3, title: desc),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
