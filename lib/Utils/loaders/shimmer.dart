import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webapp/Utils/Helpers/helper_functions.dart';
import 'package:webapp/Utils/constants/colors.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.radius = 15,
  });
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? (TColors.light),
        ),
      ),
    );
  }
}
