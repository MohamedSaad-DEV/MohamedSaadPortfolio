import 'package:go_router/go_router.dart';

import '../../Features/portfolio/views/portfolio_screen.dart';

abstract final class AppRoutes {
  static const String home = '/';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const PortfolioScreen(),
    ),
  ],
);
