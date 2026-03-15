import 'package:eddie_the_dev_frontend/core/constants/app_assets.dart';
import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/app_responsive_builder.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final HomePageController pageController;
  const HomeAppBar({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AppResponsiveBuilder(
      verticalBuilder: (context) => _baseAppBar(context),
      horizontalBuilder: (context) => _baseAppBar(context),
    );
  }

  Widget _baseAppBar(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.primary.withAlpha(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kBasePaddingM),
          child: Row(
            children: [
              _eddie(context),
              const Spacer(),
              _menu(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _eddie(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageController.selectedMenu,
      builder: (context, selectedMenu, child) {
        final isSelected = selectedMenu == null;
        return GestureDetector(
          onTap: () {
            pageController.onClickEddie();
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 250),
            scale: isSelected ? 1 : 0.9,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.myAvatar,
                    width: 30,
                    height: 30,
                  ),
                  kBasePaddingM.widthBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eddie',
                      ),
                      Text(
                        'a software developer',
                        style: TextStyle(
                          fontSize: 12,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _menu(BuildContext context) {
    return context.isVertical() ? SizedBox.shrink() : _hMenu();
  }

  Widget _hMenu() {
    return ValueListenableBuilder(
      valueListenable: pageController.selectedMenu,
      builder: (context, selectedMenu, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...MenuEnums.values.map(
              (menu) {
                final isSelected = selectedMenu == menu;
                return TextButton(
                  onPressed: () {
                    pageController.onClickMenu(menu);
                  },
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 250),
                    scale: isSelected ? 1 : 0.9,
                    child: Text(
                      menu.label,
                      style: TextStyle(
                        color: isSelected ? context.colorScheme.onSurface : context.colorScheme.onSurface.withAlpha(80),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Widget _vMenu() {
  //   return ValueListenableBuilder(
  //     valueListenable: pageController.selectedMenu,
  //     builder: (context, selectedMenu, child) {
  //       return DropdownButton<MenuEnums?>(
  //         value: selectedMenu,
  //         underline: SizedBox.shrink(),
  //         dropdownColor: context.colorScheme.surface.withAlpha((0.9 * 255).ceil()),
  //         items: MenuEnums.values.map((m) {
  //           return DropdownMenuItem<MenuEnums>(
  //             value: m,
  //             child: Text(m.label),
  //           );
  //         }).toList(),
  //         onChanged: (menu) {
  //           if (menu != null) {
  //             pageController.onClickMenu(menu);
  //           }
  //         },
  //       );
  //     },
  //   );
  // }
}
