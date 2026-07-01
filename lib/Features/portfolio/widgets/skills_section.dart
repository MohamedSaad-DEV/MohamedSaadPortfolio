import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/vertical_spacer.dart';

class _NoScrollbarScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _techIcons = <String, IconData>{
    'Dart': Icons.code,
    'Flutter': Icons.flutter_dash,
    'Firebase': Icons.local_fire_department_outlined,
    'Odoo': Icons.business_center_outlined,
    'Bloc': Icons.view_module_outlined,
    'Git': Icons.account_tree_outlined,
    'REST': Icons.api_outlined,
    'CI/CD': Icons.sync_outlined,
    'Android': Icons.android,
    'iOS': Icons.phone_iphone,
    'Python': Icons.terminal,
    'GetX': Icons.speed_outlined,
  };

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
                title: 'Skills',
                subtitle: 'Technical expertise honed across 5+ years of mobile and backend development.',
              ),
              VerticalSpacer(32),
              _buildTechOrbit(context),
              VerticalSpacer(48),
              ...PortfolioData.skillCategories.asMap().entries.map((entry) {
                return SkillCategoryCard(
                  title: entry.value.title,
                  skills: entry.value.skills,
                  index: entry.key,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTechOrbit(BuildContext context) {
    return ScrollConfiguration(
      behavior: _NoScrollbarScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
        },
      ),
      child: SizedBox(
        height: 120.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          itemCount: PortfolioData.techBackgroundIcons.length,
          separatorBuilder: (context, index) => SizedBox(width: 16.w),
          itemBuilder: (context, index) {
              final tech = PortfolioData.techBackgroundIcons[index];
              final icon = _techIcons[tech] ?? Icons.code;

              return Container(
                width: 100.w,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      UIConstants.surfaceLight,
                      UIConstants.surface,
                    ],
                  ),
                  borderRadius: UIConstants.cardRadius,
                  border: Border.all(
                    color: UIConstants.primaryBlue.withValues(alpha: 0.2),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 28.sp,
                      color: UIConstants.primaryBlue,
                    ),
                    VerticalSpacer(8),
                    Text(
                      tech,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11.sp,
                        color: UIConstants.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ).animate(onPlay: (c) => c.repeat(reverse: true)).moveY(
                    begin: 0,
                    end: index.isEven ? -6 : 6,
                    duration: Duration(milliseconds: 2000 + index * 200),
                  );
            },
          ),
        ),
    );
  }
}

class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({
    required this.title,
    required this.skills,
    required this.index,
    super.key,
  });

  final String title;
  final List<String> skills;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: UIConstants.glassCardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: UIConstants.textPrimary,
              ),
            ),
            VerticalSpacer(16),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: skills.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: UIConstants.backgroundDark.withValues(alpha: 0.5),
                    borderRadius: UIConstants.chipRadius,
                    border: Border.all(
                      color: UIConstants.border.withValues(alpha: 0.6),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: UIConstants.textSecondary,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ).animate().fadeIn(
            delay: Duration(milliseconds: 100 * index),
            duration: 500.ms,
          ),
    );
  }
}
