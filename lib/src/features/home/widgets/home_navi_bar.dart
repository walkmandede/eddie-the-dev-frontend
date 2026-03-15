import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomeNaviBar extends StatelessWidget {
  final HomePageController pageController;

  const HomeNaviBar({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.colorScheme.primary)),
      ),
      child: ValueListenableBuilder(
        valueListenable: pageController.selectedMenu,
        builder: (context, selectedMenu, child) {
          return BottomNavigationBar(
            currentIndex: selectedMenu == null ? 0 : MenuEnums.values.indexOf(selectedMenu),
            onTap: (index) {
              final menuEnum = MenuEnums.values[index];
              pageController.onClickMenu(menuEnum);
            },
            backgroundColor: Colors.transparent,
            selectedItemColor: context.colorScheme.primary,
            unselectedItemColor: context.colorScheme.surface,
            showUnselectedLabels: true,
            items: [
              ...MenuEnums.values.map((m) {
                return BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  backgroundColor: Colors.transparent,
                  label: m.label,
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
