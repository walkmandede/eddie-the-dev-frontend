import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/projects/widgets/projects_h_widget.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: context.isVertical() ? ProjectsHWidget() : ProjectsHWidget(),
    );
  }
}
