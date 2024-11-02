import 'package:crossroad/features/authentication/controllers/forget_password/forget_password.dart';
import 'package:crossroad/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              'forget_password_title'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItem,
            ),
            Text(
              'forget_password_instruction'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections * 2,
            ),
            //TextField,
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                  controller: controller.email,
                  validator: AppValidator.validateEmail,
                  decoration: InputDecoration(
                      labelText: 'email_label'.tr,
                      prefixIcon: const Icon(Iconsax.direct_right))),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.sendPasswordResetEmail();
                    },
                    child: Text('submit_button'.tr)))
            //Submit
          ],
        ),
      ),
    );
  }
}
