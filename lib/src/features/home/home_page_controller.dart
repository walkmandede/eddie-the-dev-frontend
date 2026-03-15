import 'package:eddie_the_dev_frontend/src/features/about/about_page.dart';
import 'package:eddie_the_dev_frontend/src/features/achievements/achievement_page.dart';
import 'package:eddie_the_dev_frontend/src/features/experiences/experiences_page.dart';
import 'package:eddie_the_dev_frontend/src/features/projects/projects_page.dart';
import 'package:flutter/widgets.dart';

enum MenuEnums {
  about(label: 'About', shownPage: AboutPage()),
  experiences(label: 'Experiences', shownPage: ExperiencesPage()),
  projects(label: 'Projects', shownPage: ProjectsPage()),
  achievements(label: 'Achievements', shownPage: AchievementPage());

  final String label;
  final Widget shownPage;
  const MenuEnums({
    required this.label,
    required this.shownPage,
  });
}

class HomePageController {
  //menus
  ValueNotifier<MenuEnums?> selectedMenu = ValueNotifier(null);

  void onClickEddie() async {
    selectedMenu.value = null;
  }

  void onClickMenu(MenuEnums menuEnum) async {
    selectedMenu.value = menuEnum;
  }
}
