import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/Utils/loaders/shimmer.dart';
import 'package:flutter/material.dart';

class IListTileShimmer extends StatelessWidget {
  const IListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(width: 50, height: 50),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              children: [
                TShimmerEffect(width: 100, height: 15),
                SizedBox(height: TSizes.spaceBtwItems),
                TShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}
