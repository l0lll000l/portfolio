import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/Utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';

class IboxesShimmer extends StatelessWidget {
  const IboxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
