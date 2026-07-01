import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void setActiveSection(PortfolioSection section) {
    emit(state.copyWith(activeSection: section));
  }

  void setNavBarVisible(bool visible) {
    emit(state.copyWith(isNavBarVisible: visible));
  }
}
