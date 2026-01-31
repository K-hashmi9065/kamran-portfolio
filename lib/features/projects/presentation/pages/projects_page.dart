import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_mkh/features/projects/presentation/providers/project_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_mkh/core/widgets/full_screen_image_viewer.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    // Use ScreenUtil for some padding, but standard LayoutBuilder/MediaQuery for grid responsiveness

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 0.8, // Adjust as needed
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return Card(
                      elevation: 4,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color: const Color(0xFF1F6FEB).withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF0A192F).withValues(alpha: 0.8),
                              const Color(0xFF112240).withValues(alpha: 0.8),
                              const Color(0xFF1F6FEB).withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 3,
                              child: project.images.isEmpty
                                  ? const Center(
                                      child: Icon(Icons.image_not_supported),
                                    )
                                  : PageView.builder(
                                      itemCount: project.images.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, imgIndex) {
                                        final img = project.images[imgIndex];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    FullScreenImageViewer(
                                                      images: project.images,
                                                      initialIndex: imgIndex,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: img.startsWith('http')
                                              ? Image.network(
                                                  img,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => const Center(
                                                        child: Icon(
                                                          Icons.broken_image,
                                                          size: 50,
                                                        ),
                                                      ),
                                                )
                                              : Image.asset(
                                                  img,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => const Center(
                                                        child: Icon(
                                                          Icons.broken_image,
                                                          size: 50,
                                                        ),
                                                      ),
                                                ),
                                        );
                                      },
                                    ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      project.description, // Max lines?
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    Wrap(
                                      spacing: 8,
                                      children: project.techStack
                                          .map(
                                            (tech) => Chip(
                                              label: Text(
                                                tech,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              padding: EdgeInsets.zero,
                                              side: BorderSide.none,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    const SizedBox(height: 10),
                                    if (project.projectUrl != null)
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton.icon(
                                          onPressed: () async {
                                            final uri = Uri.parse(
                                              project.projectUrl!,
                                            );
                                            if (await canLaunchUrl(uri)) {
                                              await launchUrl(uri);
                                            }
                                          },
                                          icon: const Icon(Icons.link),
                                          label: const Text('View Code'),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .animate(delay: (100 * index).ms)
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                    .shimmer(
                      delay: 400.ms,
                      duration: 1200.ms,
                      color: Colors.white.withValues(alpha: 0.3),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
