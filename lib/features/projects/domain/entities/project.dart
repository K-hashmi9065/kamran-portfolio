class Project {
  final String title;
  final String description;
  final List<String> images;
  final String? projectUrl;
  final List<String> techStack;

  String get imageUrl => images.isNotEmpty ? images.first : '';

  Project({
    required this.title,
    required this.description,
    required this.images,
    this.projectUrl,
    required this.techStack,
  });
}
