import 'dart:ui';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/eddie/eddie_page.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_app_bar.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_navi_bar.dart';
import 'package:flutter/material.dart';

final homePageController = HomePageController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: add animation later
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homePageController.selectedMenu,
      builder: (context, selectedMenu, child) {
        return SizedBox.expand(
          child: Stack(
            children: [
              //bg
              Image.asset(
                context.isDark ? 'assets/images/bg_1.jpg' : 'assets/images/bg_2.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              //backdrop
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: SizedBox.expand(
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.4),
                  ),
                ),
              ),
              //shown
              _shownPage(),
              //appbar
              if (!context.isVertical() && selectedMenu != null)
                Align(
                  alignment: Alignment.topCenter,
                  child: HomeAppBar(pageController: homePageController),
                ),
              //navbar
              if (context.isVertical() && selectedMenu != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeNaviBar(pageController: homePageController),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _shownPage() {
    return Column(
      children: [
        if (!context.isVertical()) kToolbarHeight.heightBox(),
        Expanded(
          child: homePageController.selectedMenu.value == null ? EddiePage() : homePageController.selectedMenu.value!.shownPage,
        ),

        if (context.isVertical()) kToolbarHeight.heightBox(),
      ],
    );
  }
}
