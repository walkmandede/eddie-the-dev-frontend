import 'dart:math';
import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/projects_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/project.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/app_network_image.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/base_card.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsHWidget extends StatelessWidget {
  const ProjectsHWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return SizedBox.expand(
      child: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: context.isVertical() ? kBasePaddingM : kBasePaddingL,
            vertical: context.isVertical() ? kBasePaddingM : kBasePaddingL,
          ),
          controller: scrollController,
          itemCount: projectsData.length,
          separatorBuilder: (context, index) => kBasePaddingM.heightBox(),
          itemBuilder: (context, index) {
            final project = projectsData[index];
            return _project(context, project);
          },
        ),
      ),
    );
  }

  Widget _project(BuildContext context, Project project) {
    return BaseCard(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isVertical() ? kBasePaddingM : kBasePaddingL,
          vertical: context.isVertical() ? kBasePaddingM : kBasePaddingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: context.textTheme.titleMedium,
            ),
            kBasePaddingS.heightBox(),
            Wrap(
              spacing: kBasePaddingS,
              runSpacing: kBasePaddingS,
              children: [
                ...project.badges.map((b) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kBasePaddingM,
                        vertical: kBasePaddingS,
                      ),
                      child: Text(
                        b,
                        style: context.textTheme.labelSmall,
                      ),
                    ),
                  );
                }),
              ],
            ),
            kBasePaddingS.heightBox(),
            Text(
              project.overview,
              style: context.textTheme.bodyMedium?.copyWith(
                fontFamily: AppTheme.fontNunito,
              ),
            ),
            kBasePaddingS.heightBox(),
            ...project.highlights.map((h) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    h,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontFamily: AppTheme.fontNunito,
                      height: 1.5,
                    ),
                  ),
                  kBasePaddingS.heightBox(),
                ],
              );
            }),
            if (project.screenshots.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: kBasePaddingM),
                child: SizedBox(
                  height: min(context.screenHeight(), 250),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => kBasePaddingS.widthBox(),
                    itemCount: project.screenshots.length,
                    itemBuilder: (context, index) {
                      final screenshot = project.screenshots[index];
                      return AppNetworkImage(
                        url: screenshot,
                        height: double.infinity,
                        borderRadius: kBaseBorderRadiusS,
                      );
                    },
                  ),
                ),
              ),
            if (project.technologies.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: kBasePaddingM),
                child: Wrap(
                  spacing: kBasePaddingM,
                  runSpacing: kBasePaddingM,
                  children: [
                    ...project.technologies.map(
                      (t) => BaseCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kBasePaddingM,
                            vertical: kBasePaddingS,
                          ),
                          child: Text(
                            t,
                            style: context.textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (project.metas.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: kBasePaddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: kBasePaddingM,
                  children: [
                    ...project.metas.map(
                      (m) => ElevatedButton(
                        onPressed: () {
                          try {
                            launchUrlString(m.url);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unable to open the link')));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                        ),
                        child: Row(
                          spacing: kBasePaddingM,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.string(
                              m.type.svgPath,
                              width: 25,
                              height: 25,
                              colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
                            ),
                            Text(
                              m.label,
                              style: context.textTheme.labelSmall?.copyWith(
                                color: context.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
