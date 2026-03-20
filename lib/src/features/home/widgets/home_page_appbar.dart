import 'dart:ui';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:eddie_the_dev_frontend/src/features/home/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomePageAppbar extends StatelessWidget {
  final HomePageController pageController;

  const HomePageAppbar({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pageController.selectedSection,
      builder: (context, selectedSection, child) {
        return context.isVertical()
            ? _MobileAppbar(
                pageController: pageController,
                selectedSection: selectedSection,
              )
            : _DesktopAppbar(
                pageController: pageController,
                selectedSection: selectedSection,
              );
      },
    );
  }
}

class _DesktopAppbar extends StatelessWidget {
  final HomePageController pageController;
  final EnumHomePageSection selectedSection;

  const _DesktopAppbar({
    required this.pageController,
    required this.selectedSection,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(0.3.alphaValue),
            border: Border(
              bottom: BorderSide(
                color: context.isDark ? AppColors.darkBorder.withAlpha(0.4.alphaValue) : AppColors.lightBorder.withAlpha(0.6.alphaValue),
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 80),
              _LogoText(),
              const Spacer(),
              ...EnumHomePageSection.values.map(
                (s) => _NavItem(
                  section: s,
                  isSelected: selectedSection == s,
                  onTap: () => pageController.onClickTab(s),
                ),
              ),
              const SizedBox(width: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileAppbar extends StatelessWidget {
  final HomePageController pageController;
  final EnumHomePageSection selectedSection;

  const _MobileAppbar({
    required this.pageController,
    required this.selectedSection,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
            border: Border(
              bottom: BorderSide(
                color: context.isDark ? AppColors.darkBorder.withOpacity(0.4) : AppColors.lightBorder.withOpacity(0.6),
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              _LogoText(),
              const Spacer(),
              _MobileMenuButton(
                pageController: pageController,
                selectedSection: selectedSection,
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'eddie',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: context.isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          TextSpan(
            text: '.dev',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final EnumHomePageSection section;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.section,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary.withOpacity(0.4) : Colors.transparent,
          ),
        ),
        child: Text(
          section.label,
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.primary : (context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  final HomePageController pageController;
  final EnumHomePageSection selectedSection;

  const _MobileMenuButton({
    required this.pageController,
    required this.selectedSection,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMobileMenu(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedSection.label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _MobileMenuSheet(
        pageController: pageController,
        selectedSection: selectedSection,
      ),
    );
  }
}

class _MobileMenuSheet extends StatelessWidget {
  final HomePageController pageController;
  final EnumHomePageSection selectedSection;

  const _MobileMenuSheet({
    required this.pageController,
    required this.selectedSection,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          ...EnumHomePageSection.values.map((s) {
            final isSelected = s == selectedSection;
            return ListTile(
              onTap: () {
                Navigator.pop(context);
                pageController.onClickTab(s);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 2),
              leading: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              title: Text(
                s.label,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primary : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                ),
              ),
              trailing: isSelected ? Icon(Icons.check_rounded, size: 18, color: AppColors.primary) : null,
            );
          }),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
