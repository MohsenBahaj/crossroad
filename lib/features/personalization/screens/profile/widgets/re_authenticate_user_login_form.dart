import 'package:crossroad/common/widgets/appbar/appbar.dart';
import 'package:crossroad/features/personalization/controllers/profile/update_name_controller.dart';
import 'package:crossroad/features/personalization/controllers/user_controller.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Re_Authenticate User'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'Re_Authenticate User is required it delete the account',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: AppSizes.spaceBtwSections,
            ),
            Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      expands: false,
                      validator: (value) => AppValidator.validateEmail(value),
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Iconsax.direct_right)),
                    ),
                    SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                        expands: false,
                        validator: (value) =>
                            AppValidator.validatePassword(value),
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: 'password_label'.tr,
                          suffixIcon: IconButton(
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye),
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                          ),
                          prefixIcon: const Icon(Iconsax.password_check),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                    SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Obx(
                          () => ElevatedButton(
                              onPressed: () => controller
                                  .reAuthenticateEmailAndPasswordUser(),
                              child: controller.loading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    )
                                  : Text('Verify')),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
