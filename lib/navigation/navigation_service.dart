import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../logic/providers/agency_provider.dart';
import '../presentation/screens/home/create_screen.dart';
import '../presentation/screens/home/show_screen.dart';
import '../presentation/screens/home/update_screen.dart';
import '../presentation/screens/onboarding/onboarding_screen.dart';
import '../presentation/screens/setting/about_screen.dart';
import '../presentation/screens/setting/faqs_screen.dart';
import '../presentation/screens/setting/setting_screen.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/welcome_screen.dart';
import 'app_routers.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const AppRouters(),
      routes: [
        GoRoute(
          path: 'create',
          builder: (context, state) => const CreateScreen(),
        ),
        GoRoute(
          path: 'show/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            final provider = Provider.of<AgencyProvider>(context, listen: false);
            final index = provider.agencies.indexWhere((element) => element.id == id);
            final agency = provider.agencies[index];
            return ShowScreen(agency: agency);
          },
        ),
        GoRoute(
          path: 'update/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            final provider = Provider.of<AgencyProvider>(context, listen: false);
            final index = provider.agencies.indexWhere((element) => element.id == id);
            final agency = provider.agencies[index];
            return UpdateScreen(agency: agency);
            // final agency = Provider.of<AgencyProvider>(context, listen: false)
            //     .getById(id) as Agency?;
            // if (agency == null) {
            //   return Scaffold(
            //     appBar: AppBar(
            //       title: const Text('Error'),
            //     ),
            //   );
            // }
// UpdateScreen(agency: agency);
            return SizedBox();
          },
        ),
        GoRoute(
          path: 'setting',
          builder: (context, state) => const SettingScreen(),
          routes: [
            GoRoute(
              path: 'about',
              builder: (context, state) => const AboutScreen(),
            ),
            GoRoute(
              path: 'faqs',
              builder: (context, state) => FaqsScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
