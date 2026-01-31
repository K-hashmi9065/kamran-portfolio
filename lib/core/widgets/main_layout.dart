import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_mkh/core/constants/app_constants.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const MainLayout({super.key, required this.child, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final isHome = currentPath == AppConstants.homeRoute;

    return Container(
      // 🔵 PREMIUM BLUE BACKGROUND GRADIENT
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0A192F), // Navy blue
            Color(0xFF112240), // Rich blue
            Color(0xFF1F6FEB), // Highlight blue
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // ================= APP BAR =================
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,

          // 🌫️ GLASS EFFECT APP BAR
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1F6FEB).withValues(alpha: 0.25),
                  const Color(0xFF0A192F).withValues(alpha: 0.35),
                ],
              ),
            ),
          ),

          title: isHome
              ? Text(
                  AppConstants.appName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : null,

          actions: isDesktop
              ? [
                  _NavButton(
                    label: 'Home',
                    route: AppConstants.homeRoute,
                    isSelected: currentPath == AppConstants.homeRoute,
                  ),
                  _NavButton(
                    label: 'Projects',
                    route: '/projects',
                    isSelected: currentPath.startsWith('/projects'),
                  ),
                  _NavButton(
                    label: 'Skills',
                    route: '/skills',
                    isSelected: currentPath.startsWith('/skills'),
                  ),
                  _NavButton(
                    label: 'Experience',
                    route: '/experience',
                    isSelected: currentPath.startsWith('/experience'),
                  ),
                  _NavButton(
                    label: 'About',
                    route: '/about',
                    isSelected: currentPath.startsWith('/about'),
                  ),
                  _NavButton(
                    label: 'Contact',
                    route: '/contact',
                    isSelected: currentPath.startsWith('/contact'),
                  ),
                  const SizedBox(width: 20),
                ]
              : null,
        ),

        // ================= DRAWER (MOBILE) =================
        drawer: isDesktop
            ? null
            : Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF0A192F), Color(0xFF1F6FEB)],
                        ),
                      ),
                      child: Text(
                        AppConstants.appName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _drawerItem(context, 'Home', AppConstants.homeRoute),
                    _drawerItem(context, 'Projects', '/projects'),
                    _drawerItem(context, 'Skills', '/skills'),
                    _drawerItem(context, 'Experience', '/experience'),
                    _drawerItem(context, 'About', '/about'),
                    _drawerItem(context, 'Contact', '/contact'),
                  ],
                ),
              ),

        body: child,
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        context.pop();
        context.go(route);
      },
    );
  }
}

// ================= NAV BUTTON =================

class _NavButton extends StatefulWidget {
  final String label;
  final String route;
  final bool isSelected;

  const _NavButton({
    required this.label,
    required this.route,
    required this.isSelected,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActive = widget.isSelected || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF1F6FEB).withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive ? const Color(0xFF1F6FEB) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.label,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isActive ? Colors.white : Colors.white70,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
