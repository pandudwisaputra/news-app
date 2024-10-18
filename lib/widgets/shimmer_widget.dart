import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RoundedShimmer extends StatelessWidget {
  final double height;
  final double? width;

  const RoundedShimmer({super.key, required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Theme.of(context).hintColor,
      highlightColor: Theme.of(context).focusColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
