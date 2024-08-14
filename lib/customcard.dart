import 'package:dash/const/const.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry? padding;

  const CustomCard(
      {super.key, required this.child, required this.color, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: color ?? cardBackgroundColor,
      ),
      child:
          Padding(padding: padding ?? const EdgeInsets.all(12.0), child: child),
    );
  }
}
