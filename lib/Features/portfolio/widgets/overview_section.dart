import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/horizontal_spacer.dart';
import '../../../core/widgets/portfolio_button.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../cubit/navigation_state.dart';
import 'typewriter_headline.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({
    required this.onSectionTap,
    super.key,
  });

  final void Function(PortfolioSection section) onSectionTap;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 900;

    return Container(
      key: const Key('overview'),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: UIConstants.horizontalPadding.w,
        vertical: UIConstants.sectionVerticalPadding.h,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: UIConstants.maxContentWidth),
          child: isWide ? _buildWideLayout(context) : _buildNarrowLayout(context),
        ),
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildTextContent(context)),
        HorizontalSpacer(48),
        Expanded(child: _buildProfileImage()),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return Column(
      children: [
        _buildProfileImage(),
        VerticalSpacer(32),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I\'m',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            color: UIConstants.textSecondary,
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),
        VerticalSpacer(8),
        ShaderMask(
          shaderCallback: (bounds) =>
              UIConstants.accentGradient.createShader(bounds),
          child: Text(
            PortfolioData.name,
            style: GoogleFonts.inter(
              fontSize: 52.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(begin: -0.1),
        VerticalSpacer(12),
        const TypewriterHeadline()
            .animate()
            .fadeIn(delay: 400.ms, duration: 600.ms),
        VerticalSpacer(24),
        Text(
          PortfolioData.summary,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            color: UIConstants.textSecondary,
            height: 1.7,
          ),
        ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
        VerticalSpacer(32),
        Wrap(
          spacing: 16.w,
          runSpacing: 12.h,
          children: [
            PortfolioButton(
              label: 'View Projects',
              icon: Icons.rocket_launch_outlined,
              onPressed: () => onSectionTap(PortfolioSection.projects),
            ),
            PortfolioButton(
              label: 'Contact Me',
              isOutlined: true,
              icon: Icons.mail_outline,
              onPressed: () => onSectionTap(PortfolioSection.contact),
            ),
          ],
        ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
        VerticalSpacer(24),
        _buildQuickStats(),
      ],
    );
  }

  Widget _buildQuickStats() {
    final stats = [
      ('5+', 'Years Flutter'),
      ('10+', 'Published Apps'),
      ('2+', 'Years Odoo'),
    ];

    return Row(
      children: stats.map((stat) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: stat != stats.last ? 12.w : 0),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            decoration: UIConstants.glassCardDecoration,
            child: Column(
              children: [
                Text(
                  stat.$1,
                  style: GoogleFonts.inter(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: UIConstants.primaryBlue,
                  ),
                ),
                VerticalSpacer(4),
                Text(
                  stat.$2,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: UIConstants.textMuted,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 900.ms, duration: 500.ms).scale(
                begin: const Offset(0.9, 0.9),
                end: const Offset(1, 1),
              ),
        );
      }).toList(),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: UIConstants.primaryBlue.withValues(alpha: 0.2),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            Image.asset(
              AssetsConstants.profileImage,
              fit: BoxFit.cover,
              height: 480.h,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      UIConstants.backgroundDark.withValues(alpha: 0.9),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PortfolioData.title,
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: UIConstants.textPrimary,
                      ),
                    ),
                    Text(
                      PortfolioData.subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: UIConstants.accentCyan,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 800.ms).slideX(begin: 0.1);
  }

}

Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
