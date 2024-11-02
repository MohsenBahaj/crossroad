import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/features/personalization/controllers/profile/update_name_controller.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChanegName extends StatelessWidget {
  const ChanegName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Change Name'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User real name for easy verifications. This name will apreat on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Form(
                key: controller.updateNameKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      expands: false,
                      validator: (value) =>
                          AppValidator.validateEmptyText('Fisrt name', value),
                      decoration: InputDecoration(
                          labelText: 'First name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          AppValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: InputDecoration(
                          labelText: 'Last name',
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Obx(
                          () => ElevatedButton(
                              onPressed: () => controller.updateUserName(),
                              child: controller.loading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : Text('Save')),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
