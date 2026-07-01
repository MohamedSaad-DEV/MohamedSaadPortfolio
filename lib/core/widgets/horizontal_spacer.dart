import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width.w);
}
