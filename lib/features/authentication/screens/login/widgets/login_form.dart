import 'package:crossroad/bottom_nav_bar.dart';
import 'package:crossroad/features/authentication/controllers/login/login_controller.dart';
import 'package:crossroad/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:crossroad/features/authentication/screens/signup/signup.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:crossroad/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          //email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: 'email_label'.tr),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) =>
                  AppValidator.validateEmptyText('Password', value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: 'password_label'.tr,
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //remeber me
                  Obx(() => Checkbox(
                      value: controller.rememberNe.value,
                      onChanged: (value) => controller.rememberNe.value =
                          !controller.rememberNe.value)),
                  Text('remember_me'.tr)
                ],
              ),

              //forget password
              TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: Text('forget_password'.tr)),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: controller.loading.value
                    ? SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text('sign_in_button'.tr),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwItem,
          ),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => const SignUpScreen());
              },
              child: Text('sign_up_button'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
