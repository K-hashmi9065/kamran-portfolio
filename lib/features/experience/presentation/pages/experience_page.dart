import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExperiencePage extends ConsumerWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children:
          [
                Text(
                  'My Experience',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                _buildExperienceItem(
                  context,
                  company: 'Sanjivni Gramin and Shahri Vikash Samiti',
                  role: 'Flutter Developer Intern',
                  duration: 'Aug 2025 – Jan 2026',
                  description:
                      'Contributed to the development of Flutter applications using Dart while following clean architecture principles. Built reusable widgets and responsive UI layouts to ensure consistency across devices. Integrated RESTful APIs and handled network communication efficiently. Implemented state management using BLoC, Riverpod, and Provider to improve app performance and maintainability.',
                ),
                _buildExperienceItem(
                  context,
                  company: 'Unihox Technology',
                  role: 'Flutter Developer Intern',
                  duration: 'Apr 2025 – Jul 2025',
                  description:
                      'Developed cross-platform mobile applications using Flutter and Dart. Designed modular and reusable UI components to enhance scalability and code reuse. Managed application state using BLoC, Riverpod, and Provider. Integrated RESTful APIs with proper error handling and logging to ensure reliable data flow and stable application behavior.',
                ),
              ]
              .animate(interval: 150.ms)
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.5, end: 0, curve: Curves.easeOutQuart)
              .blurXY(begin: 4, end: 0, duration: 600.ms),
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String company,
    required String role,
    required String duration,
    required String description,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: const Color(0xFF1F6FEB).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1F6FEB).withValues(alpha: 0.1),
              const Color(0xFF0A192F).withValues(alpha: 0.5),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      company,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(duration, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              const SizedBox(height: 10),
              Text(description, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
