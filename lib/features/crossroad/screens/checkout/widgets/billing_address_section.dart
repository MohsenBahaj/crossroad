import 'package:crossroad/common/widgets/texts/head_section.dart';
import 'package:crossroad/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAdressSection extends StatelessWidget {
  const BillingAdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Mohsen\'s shop',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Text(
              '+91-9100870782',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBtwItem / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: AppSizes.spaceBtwItem,
            ),
            Text(
              'South Liana , Maine 87695 , USA ',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
