import 'dart:ui';

import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomeHWidget extends StatelessWidget {
  final HomePageController pageController;

  const HomeHWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _menu(),
        centerTitle: true,
        actions: [],
      ),
      body: _body(context),
    );
  }

  Widget _menu() {
    return Row(
      children: [
        ...MenuEnums.values.map(
          (menu) => TextButton(
            onPressed: () {
              pageController.onClickMenu(menu);
            },
            child: Text(menu.label),
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
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
        ],
      ),
    );
  }
}
