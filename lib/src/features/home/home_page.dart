import 'dart:ui';
import 'package:eddie_the_dev_frontend/core/constants/app_functions.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/home/widgets/home_page_appbar.dart';
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
  bool _isCaching = true;

  @override
  void initState() {
    _precache(context);
    homePageController.initLoad();
    super.initState();
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }

  Future<void> _precache(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      await precacheImage(const AssetImage('assets/images/bg_1.jpg'), context);
      await Future.delayed(const Duration(milliseconds: 100));
    } catch (e) {
      superPrint(e);
    }

    _isCaching = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xff000c1a),
        ),
        child: _isCaching
            ? Material(
                color: Color(0xff000c1a),
                child: Center(
                  child: Text('Please wait ...'),
                ),
              )
            : Stack(
                children: [
                  //bg
                  Image.asset(
                    'assets/images/bg_1.jpg',
                    // context.isDark ? 'assets/images/bg_1.jpg' : 'assets/images/bg_2.png',
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
                  // const HomePageBorderLightBar(),
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
      ),
    );
  }
}
