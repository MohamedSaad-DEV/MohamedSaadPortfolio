import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/ui_constants.dart';
import '../cubit/navigation_cubit.dart';
import '../cubit/navigation_state.dart';
import '../widgets/contact_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/overview_section.dart';
import '../widgets/portfolio_nav_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/tech_particles_background.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<PortfolioSection, GlobalKey> _sectionKeys = {
    PortfolioSection.overview: GlobalKey(),
    PortfolioSection.experience: GlobalKey(),
    PortfolioSection.projects: GlobalKey(),
    PortfolioSection.skills: GlobalKey(),
    PortfolioSection.education: GlobalKey(),
    PortfolioSection.contact: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    PortfolioSection? closestSection;
    double closestDistance = double.infinity;

    for (final entry in _sectionKeys.entries) {
      final context = entry.value.currentContext;
      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;

      final position = box.localToGlobal(Offset.zero);
      final distance = position.dy.abs();

      if (distance < closestDistance) {
        closestDistance = distance;
        closestSection = entry.key;
      }
    }

    if (closestSection != null) {
      context.read<NavigationCubit>().setActiveSection(closestSection);
    }
  }

  void scrollToSection(PortfolioSection section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
    context.read<NavigationCubit>().setActiveSection(section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConstants.backgroundDark,
      body: Stack(
        children: [
          const Positioned.fill(child: TechParticlesBackground()),
          Column(
            children: [
              PortfolioNavBar(onSectionTap: scrollToSection),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.overview],
                        child: OverviewSection(onSectionTap: scrollToSection),
                      ),
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.experience],
                        child: const ExperienceSection(),
                      ),
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.projects],
                        child: const ProjectsSection(),
                      ),
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.skills],
                        child: const SkillsSection(),
                      ),
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.education],
                        child: const EducationSection(),
                      ),
                      KeyedSubtree(
                        key: _sectionKeys[PortfolioSection.contact],
                        child: const ContactSection(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
