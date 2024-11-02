// import 'package:crossroad/bottom_nav_bar.dart';
// import 'package:crossroad/common/widgets/appbar/appbar.dart';
// import 'package:crossroad/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:crossroad/common/widgets/products.cart/cart/promo_code.dart';
// import 'package:crossroad/common/widgets/success_screens/success_screen.dart';
// import 'package:crossroad/features/shop/screens/cart/widgets/cart_items.dart';
// import 'package:crossroad/features/shop/screens/checkout/widgets/billing_address_section.dart';
// import 'package:crossroad/features/shop/screens/checkout/widgets/billing_amount_section.dart';
// import 'package:crossroad/features/shop/screens/checkout/widgets/billing_payment_section.dart';
// import 'package:crossroad/utils/constants/colors.dart';
// import 'package:crossroad/utils/constants/image_string.dart';
// import 'package:crossroad/utils/constants/sizes.dart';
// import 'package:crossroad/utils/helpers/helper_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class CheckoutScreen extends StatelessWidget {
//   const CheckoutScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final dark = AppHelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: CustomAppBar(
//         showBackArrow: true,
//         title: Text(
//           'Order Reiview',
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(AppSizes.defaultSpace),
//           child: Column(
//             children: [
//               //items to chekc out
//               CartItems(showAddREmoveButton: false),
//               const SizedBox(
//                 height: AppSizes.spaceBtwSections,
//               ),

//               //coupon textfiled

//               AppCouponCode(dark: dark),
//               SizedBox(
//                 height: AppSizes.spaceBtwItem,
//               ),
//               //billing section
//               CircularContainer(
//                 padding: EdgeInsets.all(AppSizes.md),
//                 showBorder: true,
//                 background: dark ? AppColors.black : AppColors.white,
//                 child: Column(
//                   children: [
//                     //pricing
//                     BillingAmountSection(),
//                     const SizedBox(
//                       height: AppSizes.spaceBtwItem,
//                     )
//                     //Divider
//                     ,
//                     const Divider(),
//                     const SizedBox(
//                       height: AppSizes.spaceBtwItem,
//                     )
//                     //payment Methods
//                     ,
//                     BillingPaymentSection(),
//                     SizedBox(
//                       height: AppSizes.spaceBtwItem,
//                     )
//                     //Address
//                     ,
//                     BillingAdressSection()
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(AppSizes.defaultSpace / 2),
//         child: ElevatedButton(
//             onPressed: () {
//               Get.to(() => SuccessScreen(
//                     image: AppImageAsset.google,
//                     title: 'Payment Success!',
//                     subTitle: 'Yout Item will be shipping soon!',
//                     buttonText: 'Done',
//                     onPressed: () {
//                       Get.offAll(() => NavigationMenu());
//                     },
//                   ));
//             },
//             child: Text('Checkout \$1035.0')),
//       ),
//     );
//   }
// }
