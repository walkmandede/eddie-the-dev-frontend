import 'dart:math';
import 'package:eddie_the_dev_frontend/core/constants/app_assets.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isVertical()) return _vLayout(context);
    return SizedBox(
      width: double.infinity,
      height: context.screenHeight() - kToolbarHeight,
      child: _hLayout(context),
    );
  }

  Widget _vLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Avatar(size: min(120, context.screenWidth() * 0.28)),
          const SizedBox(height: 28),
          _AvailabilityBadge(),
          const SizedBox(height: 20),
          Text(
            profileData.name,
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          _TitleChip(),
          const SizedBox(height: 20),
          Text(
            profileData.bio,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              height: 1.7,
              color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 46,
                child: ElevatedButton.icon(
                  onPressed: () => homePageController.onClickTab(EnumHomePageSection.projects),
                  icon: const Icon(Icons.work_outline_rounded, size: 16),
                  label: const Text('View Work'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 46,
                child: OutlinedButton.icon(
                  onPressed: () => homePageController.onClickTab(EnumHomePageSection.contact),
                  icon: const Icon(Icons.mail_outline_rounded, size: 16),
                  label: const Text('Contact Me'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          _SpecialtyList(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _hLayout(BuildContext context) {
    final avatarSize = min(200.0, context.screenWidth() * 0.18);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AvailabilityBadge(),
                const SizedBox(height: 24),
                Text(
                  profileData.name,
                  style: context.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 14),
                _TitleChip(),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Text(
                    profileData.bio,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      height: 1.75,
                      color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                _CtaButtons(axis: Axis.horizontal),
                const SizedBox(height: 48),
                _SpecialtyList(),
              ],
            ),
          ),
          const SizedBox(width: 60),
          _Avatar(size: avatarSize),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final double size;

  const _Avatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 40,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          AppAssets.myAvatar,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF16A34A).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF16A34A).withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Color(0xFF16A34A),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Available for new opportunities',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF16A34A),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
        ),
      ),
      child: Text(
        profileData.title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _CtaButtons extends StatelessWidget {
  final Axis axis;

  const _CtaButtons({required this.axis});

  @override
  Widget build(BuildContext context) {
    final viewWork = SizedBox(
      height: 46,
      child: ElevatedButton.icon(
        onPressed: () => homePageController.onClickTab(EnumHomePageSection.projects),
        icon: const Icon(Icons.work_outline_rounded, size: 16),
        label: const Text('View Work'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
      ),
    );

    final contactMe = SizedBox(
      height: 46,
      child: OutlinedButton.icon(
        onPressed: () => homePageController.onClickTab(EnumHomePageSection.contact),
        icon: const Icon(Icons.mail_outline_rounded, size: 16),
        label: const Text('Contact Me'),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
      ),
    );

    if (axis == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          viewWork,
          const SizedBox(width: 12),
          contactMe,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        viewWork,
        const SizedBox(height: 12),
        contactMe,
      ],
    );
  }
}

class _SpecialtyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Wrap(
      spacing: 12,
      runSpacing: 10,
      children: profileData.specialties.map((s) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 14,
              color: AppColors.primary,
            ),
            const SizedBox(width: 6),
            Text(
              s,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
