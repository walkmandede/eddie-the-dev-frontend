import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:eddie_the_dev_frontend/src/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class HomePageFotter extends StatelessWidget {
  const HomePageFotter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.isVertical() ? 24 : 80,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: context.isVertical()
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _NameTitle(isDark: isDark),
                const SizedBox(height: 6),
                _Copyright(year: year, isDark: isDark),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NameTitle(isDark: isDark),
                _Copyright(year: year, isDark: isDark),
              ],
            ),
    );
  }
}

class _NameTitle extends StatelessWidget {
  final bool isDark;

  const _NameTitle({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: profileData.name,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          TextSpan(
            text: '\n',
            style: TextStyle(
              fontSize: 13,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          TextSpan(
            text: profileData.title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _Copyright extends StatelessWidget {
  final int year;
  final bool isDark;

  const _Copyright({required this.year, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '© $year ${profileData.name}. All rights reserved.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        Text(
          'App version: ${AppController.appVersion}',
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
