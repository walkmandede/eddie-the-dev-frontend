import 'dart:ui';

import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/achievement.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/app_network_image.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AchievementDetailWidget extends StatelessWidget {
  final Achievement achievement;

  const AchievementDetailWidget({
    super.key,
    required this.achievement,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
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
            //
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          AppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: kBasePaddingM, right: kBasePaddingM, bottom: kBasePaddingM),
              child: Column(
                children: [
                  if (achievement.imageUrl != null)
                    AppNetworkImage(
                      url: achievement.imageUrl ?? '',

                      height: context.screenHeight() * 0.3,
                    ),
                  kBasePaddingM.heightBox(),
                  Text(
                    achievement.name,
                    style: context.textTheme.titleMedium,
                  ),
                  kBasePaddingS.heightBox(),
                  RichText(
                    text: TextSpan(
                      text: 'By ',
                      style: context.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: achievement.issuer,
                          style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  kBasePaddingS.heightBox(),
                  Text(
                    DateFormat('MMM, yyyy').format(achievement.issuedDate),
                    style: context.textTheme.labelSmall,
                  ),

                  kBasePaddingS.heightBox(),
                  const Divider(),
                  kBasePaddingS.heightBox(),
                  Text(
                    'Newly Learned skills',
                    style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.primary),
                  ),
                  kBasePaddingS.heightBox(),
                  ...achievement.newSkills.map(
                    (n) => Text(
                      '- $n',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontFamily: AppTheme.fontNunito,
                      ),
                    ),
                  ),
                  const Divider(),
                  kBasePaddingS.heightBox(),
                  Text(
                    'Improved skills',
                    style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.primary),
                  ),
                  kBasePaddingS.heightBox(),
                  ...achievement.improvedSkills.map(
                    (n) => Text(
                      '- $n',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontFamily: AppTheme.fontNunito,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
