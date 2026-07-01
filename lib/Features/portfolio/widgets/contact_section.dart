import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/portfolio_button.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/vertical_spacer.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            children: [
              const SectionHeader(
                title: 'Contact',
                subtitle: 'Let\'s build something exceptional together.',
              ),
              VerticalSpacer(48),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      UIConstants.surface,
                      UIConstants.surfaceLight.withValues(alpha: 0.5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: UIConstants.primaryBlue.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Ready to discuss your next project?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: UIConstants.textPrimary,
                      ),
                    ),
                    VerticalSpacer(12),
                    Text(
                      'Available for senior Flutter roles, consulting, and freelance projects.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        color: UIConstants.textSecondary,
                      ),
                    ),
                    VerticalSpacer(32),
                    Wrap(
                      spacing: 16.w,
                      runSpacing: 16.h,
                      alignment: WrapAlignment.center,
                      children: [
                        _ContactTile(
                          icon: Icons.email_outlined,
                          label: PortfolioData.email,
                          onTap: () => _launchUrl('mailto:${PortfolioData.email}'),
                        ),
                        _ContactTile(
                          icon: Icons.phone_outlined,
                          label: PortfolioData.phone,
                          onTap: () => _launchUrl('tel:${PortfolioData.phone}'),
                        ),
                        _ContactTile(
                          icon: Icons.location_on_outlined,
                          label: PortfolioData.location,
                          onTap: () {},
                        ),
                        _ContactTile(
                          icon: FontAwesomeIcons.linkedin,
                          label: 'LinkedIn',
                          onTap: () => _launchUrl(PortfolioData.linkedInUrl),
                        ),
                      ],
                    ),
                    VerticalSpacer(32),
                    PortfolioButton(
                      label: 'Send Email',
                      icon: Icons.send_outlined,
                      onPressed: () => _launchUrl('mailto:${PortfolioData.email}'),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 700.ms).scale(
                    begin: const Offset(0.95, 0.95),
                    end: const Offset(1, 1),
                  ),
              VerticalSpacer(48),
              Text(
                '© 2026 ${PortfolioData.name}. Built with Flutter.',
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: UIConstants.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: UIConstants.backgroundDark.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: UIConstants.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18.sp, color: UIConstants.primaryBlue),
            SizedBox(width: 10.w),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: UIConstants.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
