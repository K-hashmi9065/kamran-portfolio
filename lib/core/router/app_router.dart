import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_mkh/core/constants/app_constants.dart';
import 'package:portfolio_mkh/core/widgets/main_layout.dart';
import 'package:portfolio_mkh/features/home/presentation/pages/home_page.dart';
import 'package:portfolio_mkh/features/about/presentation/pages/about_page.dart';
import 'package:portfolio_mkh/features/projects/presentation/pages/projects_page.dart';
import 'package:portfolio_mkh/features/experience/presentation/pages/experience_page.dart';
import 'package:portfolio_mkh/features/skills/presentation/pages/skills_page.dart';
import 'package:portfolio_mkh/features/contact/presentation/pages/contact_page.dart';

// Private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppConstants.homeRoute,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainLayout(currentPath: state.uri.toString(), child: child);
        },
        routes: [
          GoRoute(
            path: AppConstants.homeRoute,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/projects',
            name: 'projects',
            builder: (context, state) => const ProjectsPage(),
          ),
          GoRoute(
            path: '/experience',
            name: 'experience',
            builder: (context, state) => const ExperiencePage(),
          ),
          GoRoute(
            path: '/skills',
            name: 'skills',
            builder: (context, state) => const SkillsPage(),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            builder: (context, state) => const AboutPage(),
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            builder: (context, state) => const ContactPage(),
          ),
        ],
      ),
    ],
  );
});
