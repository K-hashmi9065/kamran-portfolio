import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_mkh/core/constants/app_constants.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Basic responsive check
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context)
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.5, end: 0, curve: Curves.easeOutBack),
              const SizedBox(height: 30),
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildImage(context)
                              .animate()
                              .fadeIn(delay: 200.ms, duration: 600.ms)
                              .slideX(
                                begin: -1,
                                end: 0,
                                curve: Curves.easeOutBack,
                              ), // Image slides from left
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: _buildText(context)
                              .animate()
                              .fadeIn(delay: 400.ms, duration: 600.ms)
                              .slideX(
                                begin: 1,
                                end: 0,
                                curve: Curves.easeOutBack,
                              ), // Text slides from right
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildImage(context)
                            .animate()
                            .fadeIn(delay: 200.ms, duration: 600.ms)
                            .slideY(
                              begin: 0.5,
                              end: 0,
                              curve: Curves.easeOutBack,
                            ),
                        const SizedBox(height: 30),
                        _buildText(context)
                            .animate()
                            .fadeIn(delay: 400.ms, duration: 600.ms)
                            .slideY(
                              begin: 0.5,
                              end: 0,
                              curve: Curves.easeOutBack,
                            ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Text(
      'About Me',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        AppConstants.profilePlaceholder,
        fit: BoxFit.cover,
        height: 300,
        width: 300,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Results-driven Flutter Developer with hands-on experience building cross-platform mobile and web applications using Flutter and Dart. Strong in developing responsive, high-performance user interfaces, integrating RESTful APIs, and applying clean architecture principles. Adept at writing clean, maintainable code and delivering smooth, consistent user experiences across Android, iOS, and web platforms.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 20),
        Text(
          'Education',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '2021 – 2025 | Indo Global College, PTU\n'
          'Bachelor of Computer Science Engineering\n\n'
          '2019 – 2021 | Bahadurganj College, Bahadurganj\n'
          'Intermediate (Science)\n\n'
          '2019 | +2 National High School, Gangi Hat\n'
          'Matriculation',
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        const SizedBox(height: 20),
        Text(
          'Key Skills',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              [
                    'Flutter & Dart',
                    'Clean Architecture',
                    'Riverpod & BLoC',
                    'Firebase & REST APIs',
                    'Responsive UI',
                    'Material & Cupertino Widgets',
                    'State Management',
                    'Form Validation',
                    'Local Storage',
                    'Theme & Dark Mode',
                    'Dio HTTP Client',
                    'JSON Parsing',
                    'Authentication',
                    'API Integration',
                    'Error Handling',
                    'Localization (i18n & l10n)',
                    'Multi-language Support',
                    'Local Notifications',
                    'Push Notifications (Basics)',
                    'MVVM / MVC',
                    'Dependency Injection',
                    'GetIt',
                    'GoRouter',
                    'Git & GitHub',
                    'Debugging',
                    'Unit Testing (Basics)',
                    'Widget Testing (Basics)',
                    'Animations (Basic)',
                    'Problem Solving',
                  ]
                  .map(
                    (skill) => Chip(label: Text(skill), side: BorderSide.none),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
