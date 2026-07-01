enum PortfolioSection {
  overview,
  experience,
  projects,
  skills,
  education,
  contact,
}

class NavigationState {
  const NavigationState({
    this.activeSection = PortfolioSection.overview,
    this.isNavBarVisible = true,
  });

  final PortfolioSection activeSection;
  final bool isNavBarVisible;

  NavigationState copyWith({
    PortfolioSection? activeSection,
    bool? isNavBarVisible,
  }) {
    return NavigationState(
      activeSection: activeSection ?? this.activeSection,
      isNavBarVisible: isNavBarVisible ?? this.isNavBarVisible,
    );
  }
}
