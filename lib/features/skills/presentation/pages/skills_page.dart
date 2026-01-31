import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsPage extends ConsumerWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),

          // Mobile App Development
          _buildSkillCategory(context, 'Mobile App Development', [
            _SkillItem('Flutter', FontAwesomeIcons.mobileScreen),
            _SkillItem('Dart', FontAwesomeIcons.code),
            _SkillItem('Android Basics', FontAwesomeIcons.android),
            _SkillItem('iOS Basics', FontAwesomeIcons.apple),
            _SkillItem('Responsive UI', FontAwesomeIcons.expand),
            _SkillItem('Material UI', FontAwesomeIcons.palette),
            _SkillItem('Cupertino Widgets', FontAwesomeIcons.mobile),
          ]),
          const SizedBox(height: 30),

          // State Management
          _buildSkillCategory(context, 'State Management', [
            _SkillItem('Riverpod', FontAwesomeIcons.layerGroup),
            _SkillItem('BLoC', FontAwesomeIcons.cubes),
            _SkillItem('Provider', FontAwesomeIcons.boxOpen),
            _SkillItem('MVVM Pattern', FontAwesomeIcons.objectGroup),
            _SkillItem('MVC Pattern', FontAwesomeIcons.diagramProject),
          ]),
          const SizedBox(height: 30),

          // Backend & Databases
          _buildSkillCategory(context, 'Backend & Databases', [
            _SkillItem('Firebase Auth', FontAwesomeIcons.userLock),
            _SkillItem('Cloud Firestore', FontAwesomeIcons.cloud),
            _SkillItem('Firebase Storage', FontAwesomeIcons.hardDrive),
            _SkillItem('REST APIs', FontAwesomeIcons.server),
            _SkillItem('Dio HTTP Client', FontAwesomeIcons.networkWired),
            _SkillItem('MySQL', FontAwesomeIcons.database),
            _SkillItem('MongoDB', FontAwesomeIcons.leaf),
            _SkillItem('JSON Handling', FontAwesomeIcons.codeBranch),
            // Localization & Notifications
            _SkillItem('Localization (i18n & l10n)', FontAwesomeIcons.globe),
            _SkillItem('Multi-language Support', FontAwesomeIcons.language),
            _SkillItem('Local Notifications', FontAwesomeIcons.bell),
            _SkillItem(
              'Push Notifications (Basics)',
              FontAwesomeIcons.paperPlane,
            ),
          ]),
          const SizedBox(height: 30),

          // Tools & Architecture
          _buildSkillCategory(context, 'Tools & Architecture', [
            _SkillItem('Git & GitHub', FontAwesomeIcons.gitAlt),
            _SkillItem('Clean Architecture', FontAwesomeIcons.sitemap),
            _SkillItem('SOLID Principles', FontAwesomeIcons.shapes),
            _SkillItem('Dependency Injection', FontAwesomeIcons.plug),
            _SkillItem('GetIt', FontAwesomeIcons.link),
            _SkillItem('GoRouter', FontAwesomeIcons.route),
            _SkillItem('Postman', FontAwesomeIcons.envelopeOpenText),
          ]),
          const SizedBox(height: 30),

          // App Features & Utilities
          _buildSkillCategory(context, 'App Features & Utilities', [
            _SkillItem('Form Validation', FontAwesomeIcons.checkCircle),
            _SkillItem('Local Storage', FontAwesomeIcons.save),
            _SkillItem('SharedPreferences', FontAwesomeIcons.box),
            _SkillItem('Hive Database', FontAwesomeIcons.cube),
            _SkillItem('Theme Switching', FontAwesomeIcons.moon),
            _SkillItem('Dark Mode', FontAwesomeIcons.circleHalfStroke),
            _SkillItem(
              'Animations (Basic)',
              FontAwesomeIcons.wandMagicSparkles,
            ),
          ]),
          const SizedBox(height: 30),

          // Testing & Quality
          _buildSkillCategory(context, 'Testing & Quality', [
            _SkillItem('Unit Testing (Basics)', FontAwesomeIcons.vial),
            _SkillItem('Widget Testing (Basics)', FontAwesomeIcons.bug),
            _SkillItem('Debugging', FontAwesomeIcons.bugSlash),
            _SkillItem('Error Handling', FontAwesomeIcons.triangleExclamation),
          ]),
          const SizedBox(height: 30),

          // Other Skills
          _buildSkillCategory(context, 'Other Skills', [
            _SkillItem('REST API Integration', FontAwesomeIcons.plugCircleBolt),
            _SkillItem('Agile Basics', FontAwesomeIcons.peopleGroup),
            _SkillItem('Problem Solving', FontAwesomeIcons.lightbulb),
            _SkillItem('UI/UX Understanding', FontAwesomeIcons.penRuler),
            _SkillItem('Code Refactoring', FontAwesomeIcons.rotate),
          ]),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<_SkillItem> skills,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: skills
              .map((skill) => _buildSkillChip(context, skill))
              .toList()
              .animate(interval: 250.ms)
              .fadeIn(duration: 750.ms)
              .slideX(
                begin: -0.6,
                end: 0,
                duration: 850.ms,
                curve: Curves.easeOutBack,
              ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, _SkillItem skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            skill.icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(width: 10.w),
          Text(skill.name, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _SkillItem {
  final String name;
  final IconData icon;

  _SkillItem(this.name, this.icon);
}
