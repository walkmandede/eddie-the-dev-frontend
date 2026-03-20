import 'dart:ui';

import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_page_appbar.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_page_border_light_bar.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_page_footer.dart';
import 'package:flutter/material.dart';
import 'package:free_scroll_listview/free_scroll_listview.dart';

//global controller - to maintain singleton
final HomePageController homePageController = HomePageController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homePageController.initLoad();
    super.initState();
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          //lightbar
          const HomePageBorderLightBar(),
          //display
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: HomePageAppbar(pageController: homePageController),
            ),
            body: FreeScrollListView(
              controller: homePageController.listViewController,
              shrinkWrap: true,
              footerView: HomePageFotter(),
              builder: (context, index) {
                final section = EnumHomePageSection.values[index];
                return section.widget;
              },
            ),
          ),
        ],
      ),
    );
  }
}
