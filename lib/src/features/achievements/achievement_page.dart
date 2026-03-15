import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/achievements/widgets/achievement_h_widget.dart';
import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isVertical() ? AchievementHWidget() : AchievementHWidget();
  }
}
