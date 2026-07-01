import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';

class TypewriterHeadline extends StatelessWidget {
  const TypewriterHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: DefaultTextStyle(
        style: GoogleFonts.jetBrainsMono(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: UIConstants.accentCyan,
        ),
        child: AnimatedTextKit(
          animatedTexts: PortfolioData.typewriterPhrases
              .map(
                (phrase) => TypewriterAnimatedText(
                  phrase,
                  speed: const Duration(milliseconds: 80),
                  cursor: '|',
                ),
              )
              .toList(),
          repeatForever: true,
          pause: const Duration(milliseconds: 2500),
        ),
      ),
    );
  }
}
