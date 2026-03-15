import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/achievements_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/achievement.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/app_network_image.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/base_card.dart';
import 'package:eddie_the_dev_frontend/src/features/achievements/widgets/achievement_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AchievementHWidget extends StatelessWidget {
  const AchievementHWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SizedBox.expand(
      child: Scrollbar(
        controller: scrollController,
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: kBasePaddingM, vertical: kBasePaddingM),
          controller: scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.isVertical() ? 1 : 2,
            childAspectRatio: 2 / 1,
            crossAxisSpacing: kBasePaddingM,
            mainAxisSpacing: kBasePaddingM,
          ),
          itemCount: achievementsData.length,
          itemBuilder: (context, index) {
            final achievement = achievementsData[index];
            return _achievement(context, achievement);
          },
        ),
      ),
    );
  }

  Widget _achievement(BuildContext context, Achievement achievement) {
    return LayoutBuilder(
      builder: (a, c) {
        return BaseCard(
          child: Padding(
            padding: const EdgeInsets.all(kBasePaddingS),
            child: Stack(
              children: [
                AppNetworkImage(
                  borderRadius: kBaseBorderRadiusS,
                  url: achievement.imageUrl ?? '',
                  boxFit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary.withAlpha((0.75 * 255).ceil()),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(kBaseBorderRadiusS)),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kBasePaddingS,
                          vertical: kBasePaddingM,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    achievement.name,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
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
                                      const Spacer(),
                                      Text(
                                        DateFormat('MMM, yyyy').format(achievement.issuedDate),
                                        style: context.textTheme.labelSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            kBasePaddingM.widthBox(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AchievementDetailWidget(achievement: achievement),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
