import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/hover_animated_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../models/experience_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: UIConstants.backgroundMid,
      padding: EdgeInsets.symmetric(
        horizontal: UIConstants.horizontalPadding.w,
        vertical: UIConstants.sectionVerticalPadding.h,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: UIConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                title: 'Work Experience',
                subtitle: 'Building scalable mobile solutions across fintech, healthcare, and enterprise.',
              ),
              VerticalSpacer(48),
              ...PortfolioData.experiences.asMap().entries.map((entry) {
                return ExperienceTimelineTile(
                  experience: entry.value,
                  index: entry.key,
                  isLast: entry.key == PortfolioData.experiences.length - 1,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ExperienceTimelineTile extends StatelessWidget {
  const ExperienceTimelineTile({
    required this.experience,
    required this.index,
    required this.isLast,
    super.key,
  });

  final ExperienceModel experience;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Column(
              children: [
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: UIConstants.accentGradient,
                    boxShadow: [
                      BoxShadow(
                        color: UIConstants.primaryBlue.withValues(alpha: 0.4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2.w,
                      color: UIConstants.border,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 32.h),
              child: HoverAnimatedCard(
                decoration: UIConstants.glassCardDecoration,
                hoverAccentColor: UIConstants.primaryBlue,
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                experience.role,
                                style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: UIConstants.textPrimary,
                                ),
                              ),
                              VerticalSpacer(4),
                              Text(
                                '${experience.company} · ${experience.location}',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: UIConstants.primaryBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: UIConstants.surfaceLight,
                            borderRadius: UIConstants.chipRadius,
                          ),
                          child: Text(
                            experience.period,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12.sp,
                              color: UIConstants.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacer(16),
                    ...experience.highlights.map(
                      (highlight) => Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6.h, right: 12.w),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 10.sp,
                                color: UIConstants.accentCyan,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                highlight,
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: UIConstants.textSecondary,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(
                    delay: Duration(milliseconds: 150 * index),
                    duration: 600.ms,
                  ).slideX(begin: 0.05),
            ),
          ),
        ],
      ),
    );
  }
}
