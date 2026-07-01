import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/portfolio/cubit/navigation_cubit.dart';
import 'core/constants/ui_constants.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocProvider(
          create: (_) => NavigationCubit(),
          child: MaterialApp.router(
            title: 'Mohamed Saad | Senior Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: UIConstants.backgroundDark,
              colorScheme: const ColorScheme.dark(
                primary: UIConstants.primaryBlue,
                secondary: UIConstants.accentCyan,
                surface: UIConstants.surface,
              ),
              textTheme: GoogleFonts.interTextTheme(
                ThemeData.dark().textTheme,
              ),
              useMaterial3: true,

            ),
            routerConfig: appRouter,
          ),
        );
      },
    );
  }
}
