import 'package:eddie_the_dev_frontend/core/constants/app_assets.dart';
import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/src/controllers/app_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/eddie/eddie_page_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:eddie_the_dev_frontend/src/features/users_info/users_info_page.dart';
import 'package:flutter/material.dart';

class EddieHWidget extends StatelessWidget {
  const EddieHWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth() * 0.05,
          vertical: context.screenHeight() * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.myAvatar,
              height: context.screenHeight() * 0.3,
            ),
            kBasePaddingL.heightBox(),
            Text(
              'Eddie',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            kBasePaddingM.heightBox(),
            Text(
              EddiePageController.subtitle,
              style: TextStyle(
                fontSize: 18,
                color: context.colorScheme.primary,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            kBasePaddingL.heightBox(),
            FittedBox(
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    [
                      'Flutter Developer',
                      'Node.js Developer',
                    ].map((e) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          color: context.colorScheme.surface.withAlpha(150),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: kBasePaddingM,
                            vertical: kBasePaddingS,
                          ),
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 16, color: context.colorScheme.inverseSurface),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            kBasePaddingM.heightBox(),
            Text(
              EddiePageController.shortDesc,
              style: TextStyle(
                fontSize: 18,
                color: context.colorScheme.inverseSurface,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            kBasePaddingL.heightBox(),
            TextButton(
              onPressed: () {
                homePageController.onClickMenu(MenuEnums.about);
              },
              child: Text(
                'See more about me',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            kBasePaddingL.heightBox(),
            Text(
              'Version: ${AppController.appVersion}',
              style: context.textTheme.bodySmall,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            kBasePaddingL.heightBox(),
            GestureDetector(
              onLongPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(),
                  ),
                );
              },
              child: Text(
                'Version: ${AppController.appVersion}',
                style: context.textTheme.bodySmall?.copyWith(color: Colors.transparent),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
