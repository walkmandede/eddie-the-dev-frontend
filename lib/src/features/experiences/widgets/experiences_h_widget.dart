import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/experiences_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/experience.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/base_card.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExperienceHWidget extends StatelessWidget {
  const ExperienceHWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SizedBox.expand(
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: kBasePaddingL,
            vertical: kBasePaddingL,
          ),
          controller: scrollController,
          itemCount: experiencesData.length,
          separatorBuilder: (context, index) => kBasePaddingM.heightBox(),
          itemBuilder: (context, index) {
            final experience = experiencesData[index];
            return _experience(context, experience);
          },
        ),
      ),
    );
  }

  Widget _experience(BuildContext context, Experience experience) {
    return BaseCard(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kBasePaddingL, vertical: kBasePaddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${experience.company} (${experience.jobNatureEnum.label} - ${experience.jobTypeEnum.label})',
                  style: context.textTheme.titleMedium,
                ),
                const Spacer(),
              ],
            ),
            Text(
              experience.location,
              style: context.textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  experience.position,
                  style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.primary),
                ),
                const Spacer(),
              ],
            ),
            Text(
              '${DateFormat("MMM, yyyy").format(experience.startDate)} - ${experience.endDate == null ? 'Present' : DateFormat("MMM, yyyy").format(experience.endDate!)}',
              style: context.textTheme.bodySmall,
            ),
            kBasePaddingS.heightBox(),
            ...experience.description.map(
              (d) => Text(
                '-  $d',
                style: context.textTheme.labelLarge?.copyWith(
                  fontFamily: AppTheme.fontNunito,
                  height: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
