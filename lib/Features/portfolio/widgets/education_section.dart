import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/vertical_spacer.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final education = PortfolioData.education;

    return Container(
      width: double.infinity,
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
                title: 'Education',
                subtitle: 'Academic foundation with award-winning graduation project.',
              ),
              VerticalSpacer(48),
              Container(
                padding: EdgeInsets.all(32.w),
                decoration: UIConstants.glassCardDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            gradient: UIConstants.accentGradient,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Icon(
                            Icons.school_outlined,
                            size: 32.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                education.degree,
                                style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: UIConstants.textPrimary,
                                ),
                              ),
                              VerticalSpacer(4),
                              Text(
                                '${education.institution} · ${education.period}',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  color: UIConstants.primaryBlue,
                                ),
                              ),
                              VerticalSpacer(8),
                              Wrap(
                                spacing: 12.w,
                                runSpacing: 8.h,
                                children: [
                                  _InfoChip(label: 'Grade: ${education.grade}'),
                                  _InfoChip(label: education.role),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacer(32),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: UIConstants.backgroundDark.withValues(alpha: 0.5),
                        borderRadius: UIConstants.cardRadius,
                        border: Border.all(
                          color: UIConstants.accentGold.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_events_outlined,
                                color: UIConstants.accentGold,
                                size: 20.sp,
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Text(
                                  'Graduation Project: ${education.projectTitle}',
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: UIConstants.textPrimary,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: UIConstants.accentGold.withValues(alpha: 0.15),
                                  borderRadius: UIConstants.chipRadius,
                                ),
                                child: Text(
                                  education.projectGrade,
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 12.sp,
                                    color: UIConstants.accentGold,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          VerticalSpacer(16),
                          ...education.projectDetails.map(
                            (detail) => Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 16.sp,
                                    color: UIConstants.success,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      detail,
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        color: UIConstants.textSecondary,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalSpacer(12),
                          Wrap(
                            spacing: 8.w,
                            runSpacing: 8.h,
                            children: education.projectTechnologies.map((tech) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: UIConstants.surfaceLight,
                                  borderRadius: UIConstants.chipRadius,
                                ),
                                child: Text(
                                  tech,
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 11.sp,
                                    color: UIConstants.textMuted,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(24),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: UIConstants.primaryBlue.withValues(alpha: 0.1),
                        borderRadius: UIConstants.cardRadius,
                        border: Border.all(
                          color: UIConstants.primaryBlue.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.military_tech_outlined,
                            color: UIConstants.primaryBlue,
                            size: 24.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              education.achievement,
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                color: UIConstants.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: UIConstants.surfaceLight,
        borderRadius: UIConstants.chipRadius,
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          color: UIConstants.textSecondary,
        ),
      ),
    );
  }
}
