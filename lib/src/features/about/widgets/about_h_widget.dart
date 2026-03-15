import 'package:eddie_the_dev_frontend/core/constants/app_assets.dart';
import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/constants/app_svgs.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/profile_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/profile.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/widgets/base_card.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutHWidget extends StatelessWidget {
  const AboutHWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kBasePaddingL,
          vertical: kBasePaddingL,
        ),
        child: BaseCard(
          child: _body(context),
        ),
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.myAvatar,
          height: context.screenHeight() * 0.2,
          width: context.screenHeight() * 0.2,
          fit: BoxFit.contain,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Eddie',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            kBasePaddingM.heightBox(),
            Text(
              'Software Developer',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            kBasePaddingL.heightBox(),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_city,
                  ),
                  kBasePaddingM.widthBox(),
                  Text('Bangkok, Thailand'),
                ],
              ),
            ),
            kBasePaddingS.heightBox(),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.code),
                  kBasePaddingM.widthBox(),
                  Text('Code since 2019  '),
                ],
              ),
            ),
            kBasePaddingL.heightBox(),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: kBasePaddingM,
                children: [
                  ...profileData.socialLinks.map(
                    (e) {
                      late String svg;

                      switch (e.type) {
                        case SocialType.github:
                          svg = AppSvgs.github;
                        case SocialType.linkedin:
                          svg = AppSvgs.linkedIn;
                        case SocialType.email:
                          svg = AppSvgs.email;
                      }

                      return OutlinedButton(
                        onPressed: () async {
                          try {
                            await launchUrlString(e.url);
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Unable to open the link'),
                                ),
                              );
                            }
                          }
                        },
                        child: Column(
                          children: [
                            SvgPicture.string(
                              svg,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              e.type.name,
                              style: TextStyle(
                                fontSize: 12,
                                color: context.colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    final scrollController = ScrollController();
    return SizedBox.expand(
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: false,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: kBasePaddingL,
            vertical: kBasePaddingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _profile(context),
              kBasePaddingL.heightBox(),
              Text(
                'Bio',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              kBasePaddingM.heightBox(),
              Text(
                profileData.bio,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontFamily: AppTheme.fontNunito,
                  height: 1.5,
                ),
              ),
              kBasePaddingL.heightBox(),
              Text(
                'About Me',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              kBasePaddingM.heightBox(),
              Text(
                profileData.aboutMe,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontFamily: AppTheme.fontNunito,
                  height: 1.5,
                ),
              ),
              kBasePaddingL.heightBox(),
              Text(
                'Specialities',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              kBasePaddingM.heightBox(),
              Wrap(
                spacing: kBasePaddingM,
                runSpacing: kBasePaddingM,
                children: [
                  ...profileData.specialties.map(
                    (s) => Transform.translate(
                      offset: Offset(4, 0),
                      child: BaseCard(
                        borderColor: context.colorScheme.primaryContainer,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: kBasePaddingM, vertical: kBasePaddingS / 2),
                          child: Text(s),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              kBasePaddingL.heightBox(),
            ],
          ),
        ),
      ),
    );
  }
}
