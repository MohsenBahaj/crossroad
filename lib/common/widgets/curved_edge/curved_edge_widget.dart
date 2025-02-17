import 'package:crossroad/common/widgets/curved_edge/custom_clipper.dart';
import 'package:flutter/material.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AppCustomCurvedEdge(), child: child);
  }
}
