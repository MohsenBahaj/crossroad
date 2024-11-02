import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/features/personalization/screens/address/add_new_adress.dart';
import 'package:crossroad/features/personalization/screens/address/widgets/single_address.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
        onPressed: () => Get.to(
          () => const AddNewAddress(),
        ),
      ),
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(
                selectedAddress: false,
              ),
              SingleAddress(
                selectedAddress: true,
              ),
              SingleAddress(
                selectedAddress: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
