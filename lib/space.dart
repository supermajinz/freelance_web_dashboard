import 'package:dash/size_config.dart';
import 'package:flutter/material.dart';

class HorizintalSpace extends StatelessWidget {
  const HorizintalSpace(this.value, {super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.defaultSize! * value);
  }
}

class VirticalSpace extends StatelessWidget {
  const VirticalSpace(this.value, {super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.defaultSize! * value);
  }
}
