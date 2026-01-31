import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_mkh/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  Future<void> _launchUrl(String urlString) async {
    final uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children:
              [
                    const Text(
                      'Get in Touch',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'I am available for freelance work and open to new opportunities. Feel free to reach out!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 40),
                    ListTile(
                      leading: const Icon(Icons.email, size: 30),
                      title: const Text('Email'),
                      subtitle: const Text('kamranhashmi9065@gmail.com'),
                      onTap: () => _launchUrl(AppConstants.email),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone, size: 30),
                      title: const Text('Phone'),
                      subtitle: const Text('+91 9065433382'),
                      onTap: () => _launchUrl(AppConstants.phone),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.github, size: 30),
                      title: const Text('GitHub'),
                      subtitle: const Text('github.com/K-hashmi9065'),
                      onTap: () => _launchUrl(AppConstants.githubUrl),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        size: 30,
                      ),
                      title: const Text('LinkedIn'),
                      subtitle: const Text('linkedin.com/in/k-hashmi9065'),
                      onTap: () => _launchUrl(AppConstants.linkedinUrl),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const FaIcon(FontAwesomeIcons.twitter, size: 30),
                      title: const Text('Twitter / X'),
                      subtitle: const Text('@MdKamranHa96834'),
                      onTap: () => _launchUrl(AppConstants.twitterUrl),
                    ),
                  ]
                  .animate(interval: 150.ms)
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 1, end: 0, curve: Curves.easeOutBack)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                  ),
        ),
      ),
    );
  }
}
