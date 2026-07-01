import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/portfolio_data.dart';
import '../../../core/constants/ui_constants.dart';
import '../../../core/widgets/hover_animated_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../models/project_model.dart';
import '../services/store_icon_service.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                title: 'Projects',
                subtitle:
                    'Production apps and ongoing fintech work across mobile and enterprise platforms.',
              ),
              VerticalSpacer(40),
              _ProjectsSubsection(
                title: 'In Progress',
                subtitle: 'Currently building and preparing for launch.',
                projects: PortfolioData.inProgressProjects,
                startIndex: 0,
              ),
              VerticalSpacer(40),
              _ProjectsSubsection(
                title: 'Published',
                subtitle: 'Live on Google Play, App Store, and enterprise deployments.',
                projects: PortfolioData.projects,
                startIndex: PortfolioData.inProgressProjects.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectsSubsection extends StatelessWidget {
  const _ProjectsSubsection({
    required this.title,
    required this.subtitle,
    required this.projects,
    required this.startIndex,
  });

  final String title;
  final String subtitle;
  final List<ProjectModel> projects;
  final int startIndex;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 900;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: UIConstants.textPrimary,
              ),
            ),
            if (title == 'In Progress') ...[
              SizedBox(width: 10.w),
              _InProgressBadge(),
            ],
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: UIConstants.textSecondary,
          ),
        ),
        VerticalSpacer(24),
        LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = isWide
                ? (constraints.maxWidth - 24.w) / 2
                : constraints.maxWidth;

            return Wrap(
              spacing: 24.w,
              runSpacing: 24.h,
              children: projects.asMap().entries.map((entry) {
                return SizedBox(
                  width: cardWidth,
                  child: ProjectCard(
                    project: entry.value,
                    index: startIndex + entry.key,
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}

class _InProgressBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: UIConstants.accentGold.withValues(alpha: 0.15),
        borderRadius: UIConstants.chipRadius,
        border: Border.all(
          color: UIConstants.accentGold.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              color: UIConstants.accentGold,
              shape: BoxShape.circle,
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).fade(
                begin: 0.4,
                end: 1,
                duration: 900.ms,
              ),
          SizedBox(width: 6.w),
          Text(
            'Active',
            style: GoogleFonts.inter(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: UIConstants.accentGold,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    required this.index,
    super.key,
  });

  final ProjectModel project;
  final int index;

  @override
  Widget build(BuildContext context) {
    final decoration = project.isInProgress
        ? UIConstants.glassCardDecoration.copyWith(
            border: Border.all(
              color: UIConstants.accentGold.withValues(alpha: 0.35),
            ),
          )
        : UIConstants.glassCardDecoration;

    return HoverAnimatedCard(
      decoration: decoration,
      hoverAccentColor: project.isInProgress
          ? UIConstants.accentGold
          : UIConstants.primaryBlue,
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProjectIcon(project: project),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            project.name,
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: UIConstants.textPrimary,
                            ),
                          ),
                        ),
                        if (project.isInProgress) _InProgressChip(),
                      ],
                    ),
                    Text(
                      project.platforms,
                      style: GoogleFonts.inter(
                        fontSize: 11.sp,
                        color: project.isInProgress
                            ? UIConstants.accentGold
                            : UIConstants.accentCyan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            project.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: UIConstants.textSecondary,
              height: 1.4,
            ),
          ),
          SizedBox(height: 8.h),
          ...project.contributions.take(project.isInProgress ? 3 : 2).map(_buildBullet),
          SizedBox(height: 10.h),
          Wrap(
            spacing: 6.w,
            runSpacing: 6.h,
            children: project.technologies.map(_buildTechChip).toList(),
          ),
          if (_hasLinks) ...[
            SizedBox(height: 10.h),
            _buildStoreLinks(),
          ],
        ],
      ),
    ).animate().fadeIn(
          delay: Duration(milliseconds: 100 * index),
          duration: 600.ms,
        ).slideY(begin: 0.08);
  }

  bool get _hasLinks =>
      project.playStoreUrl != null ||
      project.appStoreUrl != null ||
      project.odooUrl != null ||
      project.githubUrl != null;

  Widget _buildBullet(String item) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.inter(
              color: UIConstants.primaryBlue,
              fontSize: 13.sp,
            ),
          ),
          Expanded(
            child: Text(
              item,
              maxLines: project.isInProgress ? 2 : 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: UIConstants.textMuted,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String tech) {
    final isAlpaca = tech.toLowerCase().contains('alpaca');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: isAlpaca
            ? UIConstants.accentGold.withValues(alpha: 0.12)
            : UIConstants.surfaceLight,
        borderRadius: UIConstants.chipRadius,
        border: Border.all(
          color: isAlpaca
              ? UIConstants.accentGold.withValues(alpha: 0.4)
              : UIConstants.border.withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        tech,
        style: GoogleFonts.jetBrainsMono(
          fontSize: 10.sp,
          color: isAlpaca ? UIConstants.accentGold : UIConstants.textSecondary,
        ),
      ),
    );
  }

  Widget _buildStoreLinks() {
    return Wrap(
      spacing: 6.w,
      runSpacing: 6.h,
      children: [
        if (project.playStoreUrl != null)
          _StoreLinkButton(
            label: 'Play Store',
            icon: Icons.android,
            url: project.playStoreUrl!,
          ),
        if (project.appStoreUrl != null)
          _StoreLinkButton(
            label: 'App Store',
            icon: Icons.apple,
            url: project.appStoreUrl!,
          ),
        if (project.odooUrl != null)
          _StoreLinkButton(
            label: 'Odoo',
            icon: Icons.business_center_outlined,
            url: project.odooUrl!,
          ),
        if (project.githubUrl != null)
          _StoreLinkButton(
            label: 'GitHub',
            icon: Icons.code,
            url: project.githubUrl!,
          ),
      ],
    );
  }
}

class _InProgressChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: UIConstants.accentGold.withValues(alpha: 0.15),
        borderRadius: UIConstants.chipRadius,
      ),
      child: Text(
        'In Progress',
        style: GoogleFonts.inter(
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          color: UIConstants.accentGold,
        ),
      ),
    );
  }
}

class ProjectIcon extends StatefulWidget {
  const ProjectIcon({required this.project, super.key});

  final ProjectModel project;

  @override
  State<ProjectIcon> createState() => _ProjectIconState();
}

class _ProjectIconState extends State<ProjectIcon> {
  late Future<String?> _iconFuture;

  @override
  void initState() {
    super.initState();
    _iconFuture = StoreIconService.resolveIconUrl(
      playStorePackageId: widget.project.playStorePackageId,
      appStoreId: widget.project.appStoreId,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.project.logoAsset != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          widget.project.logoAsset!,
          width: 48.w,
          height: 48.w,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _fallbackIcon(),
        ),
      );
    }

    return FutureBuilder<String?>(
      future: _iconFuture,
      builder: (context, snapshot) {
        final iconUrl = snapshot.data;
        if (iconUrl != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: iconUrl,
              width: 48.w,
              height: 48.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => _fallbackIcon(),
              errorWidget: (context, url, error) => _fallbackIcon(),
            ),
          );
        }
        return _fallbackIcon();
      },
    );
  }

  Widget _fallbackIcon() {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        gradient: UIConstants.accentGradient,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          widget.project.name.isNotEmpty ? widget.project.name[0] : '?',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _StoreLinkButton extends StatelessWidget {
  const _StoreLinkButton({
    required this.label,
    required this.icon,
    required this.url,
  });

  final String label;
  final IconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(color: UIConstants.border),
          borderRadius: UIConstants.chipRadius,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13.sp, color: UIConstants.textSecondary),
            SizedBox(width: 4.w),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                color: UIConstants.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
