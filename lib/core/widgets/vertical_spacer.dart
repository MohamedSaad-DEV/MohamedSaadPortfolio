import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacer extends StatelessWidget {
  const VerticalSpacer(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height.h);
}
