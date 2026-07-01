import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/ui_constants.dart';
import '../cubit/navigation_cubit.dart';
import '../cubit/navigation_state.dart';

class PortfolioNavBar extends StatelessWidget {
  const PortfolioNavBar({
    required this.onSectionTap,
    super.key,
  });

  final void Function(PortfolioSection section) onSectionTap;

  static const _sections = [
    (PortfolioSection.overview, 'Overview'),
    (PortfolioSection.experience, 'Experience'),
    (PortfolioSection.projects, 'Projects'),
    (PortfolioSection.skills, 'Skills'),
    (PortfolioSection.education, 'Education'),
    (PortfolioSection.contact, 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 900;

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: UIConstants.backgroundDark.withValues(alpha: 0.85),
            border: Border(
              bottom: BorderSide(
                color: UIConstants.border.withValues(alpha: 0.5),
              ),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: UIConstants.maxContentWidth,
              ),
              child: Row(
                children: [
                  Text(
                    'MS',
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      foreground: Paint()
                        ..shader = UIConstants.accentGradient.createShader(
                          const Rect.fromLTWH(0, 0, 60, 30),
                        ),
                    ),
                  ),
                  const Spacer(),
                  if (isWide)
                    ..._sections.map((entry) {
                      final isActive = state.activeSection == entry.$1;
                      return Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: TextButton(
                          onPressed: () => onSectionTap(entry.$1),
                          style: TextButton.styleFrom(
                            foregroundColor: isActive
                                ? UIConstants.primaryBlue
                                : UIConstants.textSecondary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                          ),
                          child: Text(
                            entry.$2,
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight:
                                  isActive ? FontWeight.w600 : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    })
                  else
                    PopupMenuButton<PortfolioSection>(
                      icon: const Icon(Icons.menu, color: UIConstants.textPrimary),
                      color: UIConstants.surface,
                      onSelected: onSectionTap,
                      itemBuilder: (context) => _sections
                          .map(
                            (entry) => PopupMenuItem(
                              value: entry.$1,
                              child: Text(
                                entry.$2,
                                style: GoogleFonts.inter(
                                  color: UIConstants.textPrimary,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
