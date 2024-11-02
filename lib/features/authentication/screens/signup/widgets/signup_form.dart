import 'package:crossroad/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:crossroad/features/authentication/screens/signup/verify_email.dart';
import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/helpers/helper_functions.dart';
import 'package:crossroad/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final bool dark = AppHelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.firstNAme,
                  validator: (value) =>
                      AppValidator.validateEmptyText('First name', value),
                  decoration: InputDecoration(
                      labelText: 'first_name'.tr,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: controller.lastName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('Last name', value),
                  decoration: InputDecoration(
                      labelText: 'last_name'.tr,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            expands: false,
            controller: controller.username,
            validator: (value) =>
                AppValidator.validateEmptyText('Username', value),
            decoration: InputDecoration(
                labelText: 'username'.tr,
                prefixIcon: const Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            expands: false,
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: InputDecoration(
                labelText: 'email_label'.tr,
                prefixIcon: const Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
                labelText: 'phone_number'.tr,
                prefixIcon: const Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              expands: false,
              validator: (value) => AppValidator.validatePassword(value),
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
          const SizedBox(
            height: AppSizes.defaultSpace,
          ),
          Row(
            children: [
              SizedBox(
                child: Obx(() => Checkbox(
                    value: controller.privacyCheckbox.value,
                    onChanged: (val) {
                      controller.privacyCheckbox.value =
                          !controller.privacyCheckbox.value;
                    })),
              ),
              const SizedBox(
                width: AppSizes.spaceBtwItem - 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'i_agree_to'.tr,
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'privacy_policy'.tr,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.primary,
                            )),
                    TextSpan(
                        text: 'and'.tr,
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'terms_of_use'.tr,
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? AppColors.white : AppColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? AppColors.white : AppColors.primary,
                            )),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Obx(
              () => ElevatedButton(
                  onPressed: () {
                    controller.signup();
                  },
                  child: controller.loading.value
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : Text('sign_up_button'.tr)),
            ),
          )
        ],
      ),
    );
  }
}
