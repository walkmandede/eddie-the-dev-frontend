import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/experiences/widgets/experiences_h_widget.dart';
import 'package:flutter/material.dart';

class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isVertical() ? ExperienceHWidget() : ExperienceHWidget();
  }
}
