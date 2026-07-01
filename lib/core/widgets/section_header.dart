import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ui_constants.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 36.sp,
            fontWeight: FontWeight.w700,
            color: UIConstants.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 60.w,
          height: 4.h,
          decoration: BoxDecoration(
            gradient: UIConstants.accentGradient,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: UIConstants.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
