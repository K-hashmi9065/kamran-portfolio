import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_mkh/features/projects/domain/entities/project.dart';

final projectsProvider = Provider<List<Project>>((ref) {
  return [
    Project(
      title: 'Medicine Reminder App',
      description:
          'Flutter app that helps users schedule and receive timely reminders for medicines. Focused on simple UI and reliable notifications.',
      images: [
        'assets/images/med_app_splash.png',
        'assets/images/med_app_home_empty.png',
        'assets/images/med_app_add_med.png',
        'assets/images/med_app_select_time.png',
        'assets/images/med_app_home_list.png',
        'assets/images/med_app_notification.png',
      ],
      techStack: ['Flutter', 'Local Notifications', 'Clean Architecture'],
      projectUrl: 'https://github.com/K-hashmi9065/CL_corporation_assign.git',
    ),

    Project(
      title: 'Saving Money App',
      description:
          'Developed a cross-platform saving money app using Dart, following scalable architecture principles. Implemented Clean Architecture to improve maintainability.',
      images: [
        'assets/images/saving_app_login.png',
        'assets/images/saving_app_dashboard.png',
        'assets/images/saving_app_goal.png',
        'assets/images/saving_app_add_savings.png',
        'assets/images/saving_app_details.png',
      ],
      techStack: ['Flutter', 'Dart', 'Clean Architecture'],
      projectUrl:
          "https://github.com/K-hashmi9065/trezo-kamran.git", // Add URL if available
    ),
    Project(
      title: 'AI Chatbot App',
      description:
          'Flutter-based AI chatbot app enabling real-time conversational interactions. Integrated AI APIs with a structured architecture.',
      images: [
        'assets/images/ai_chatbot_splash.png',
        'assets/images/ai_chatbot_login.png',
        'assets/images/ai_chatbot_chat.png',
      ],
      techStack: ['Flutter', 'AI APIs', 'Scalable Architecture'],
      projectUrl: "https://github.com/K-hashmi9065/flutter_chatbot.git",
    ),
    Project(
      title: 'Tic Tac Toe',
      description:
          'Cross-platform Tic Tac Toe game with smooth user experience and clean code structure.',
      images: [
        'assets/images/tictactoe_1.png',
        'assets/images/tictactoe_2.png',
      ],
      techStack: ['Flutter', 'Dart', 'Game Logic'],
      projectUrl:
          "https://github.com/K-hashmi9065/digital_guruji_assign_tic_tac_toe.git",
    ),
  ];
});
