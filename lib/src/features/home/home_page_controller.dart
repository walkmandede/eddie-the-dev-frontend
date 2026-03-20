import 'package:eddie_the_dev_frontend/core/constants/app_functions.dart';
import 'package:eddie_the_dev_frontend/core/repo/user_info_repo.dart';
import 'package:eddie_the_dev_frontend/core/services/firebase_service.dart';
import 'package:eddie_the_dev_frontend/src/features/contact/contact_page.dart';
import 'package:eddie_the_dev_frontend/src/features/experience/expereience_page.dart';
import 'package:eddie_the_dev_frontend/src/features/hero/hero_page.dart';
import 'package:eddie_the_dev_frontend/src/features/highlights/highlights_page.dart';
import 'package:eddie_the_dev_frontend/src/features/projects/projects_page.dart';
import 'package:eddie_the_dev_frontend/src/features/tech_stack/tech_stack_page.dart';
import 'package:flutter/material.dart';
import 'package:free_scroll_listview/free_scroll_listview.dart';

enum EnumHomePageSection {
  about(label: 'About', widget: HeroPage()),
  projects(label: 'Projects', widget: ProjectsPage()),
  experience(label: 'Experience', widget: ExperiencePage()),
  highlights(label: 'Highlights', widget: HighlightsPage()),
  techStack(label: 'Tech Stack', widget: TechStackPage()),
  contact(label: 'Contact', widget: ContactPage());

  final String label;
  final Widget widget;
  const EnumHomePageSection({required this.label, required this.widget});
}

class HomePageController {
  FreeScrollListViewController listViewController = FreeScrollListViewController();
  ValueNotifier<EnumHomePageSection> selectedSection = ValueNotifier(EnumHomePageSection.about);

  bool _isScrolling = false;

  void initLoad() async {
    listViewController.addListener(_listenListViewScroll);
    listViewController.setDataAndScrollTo(EnumHomePageSection.values);
    selectedSection.addListener(_listenEnumChanges);
  }

  void dispose() async {
    listViewController.removeListener(_listenListViewScroll);
    selectedSection.removeListener(_listenEnumChanges);
  }

  void _listenListViewScroll() async {
    if (!_isScrolling) {
      final currentIndex = EnumHomePageSection.values.indexOf(selectedSection.value);
      final startIndex = listViewController.currentStartIndex;
      if (currentIndex != startIndex) {
        selectedSection.value = EnumHomePageSection.values[startIndex];
      }
    }
  }

  void _listenEnumChanges() async {
    final firebaseService = FirebaseService();
    final userInfoRepo = UserInfoRepo(firebaseService: firebaseService);
    userInfoRepo.updateVisitedSection(selectedSection.value.label);
  }

  void onClickTab(EnumHomePageSection enumHomePageSection) async {
    final index = EnumHomePageSection.values.indexOf(enumHomePageSection);
    selectedSection.value = enumHomePageSection;
    _isScrolling = true;
    await listViewController.scrollToIndex(index, duration: const Duration(milliseconds: 250));
    _isScrolling = false;
  }
}
