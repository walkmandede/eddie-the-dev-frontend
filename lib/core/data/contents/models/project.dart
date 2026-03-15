import 'package:eddie_the_dev_frontend/core/constants/app_svgs.dart';

class Project {
  final String name;
  final String overview;
  final List<String> highlights;
  final List<ProjectMeta> metas;
  final List<String> screenshots;
  final List<String> technologies;
  final List<String> badges;
  final bool isFeatured;

  const Project({
    required this.name,
    required this.overview,
    required this.highlights,
    required this.metas,
    required this.screenshots,
    required this.technologies,
    this.badges = const [],
    this.isFeatured = false,
  });
}

class ProjectMeta {
  final ProjectMetaType type;
  final String label;
  final String url;

  const ProjectMeta({
    required this.type,
    required this.label,
    required this.url,
  });
}

enum ProjectMetaType {
  playStore(svgPath: AppSvgs.playStore, label: 'Playstore'),
  appStore(svgPath: AppSvgs.appStore, label: 'Appstore'),
  github(svgPath: AppSvgs.github, label: 'Github'),
  website(svgPath: AppSvgs.website, label: 'Web'),
  link(svgPath: AppSvgs.link, label: 'Open');

  final String svgPath;
  final String label;
  const ProjectMetaType({required this.svgPath, required this.label});
}
