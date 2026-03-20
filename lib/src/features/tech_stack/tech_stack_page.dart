import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/tech_item.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechStackPage extends StatelessWidget {
  const TechStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isVertical() ? _vLayout(context) : _hLayout(context);
  }

  Widget _vLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(),
          const SizedBox(height: 32),
          ...TechDepth.values.map(
            (depth) => _DepthGroup(depth: depth, columns: 3),
          ),
        ],
      ),
    );
  }

  Widget _hLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(),
          const SizedBox(height: 48),
          ...TechDepth.values.map(
            (depth) => _DepthGroup(depth: depth, columns: 6),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tech Stack',
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 8),
        Text(
          'Technologies I work with, grouped by depth of experience.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: context.isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}

class _DepthGroup extends StatelessWidget {
  final TechDepth depth;
  final int columns;

  const _DepthGroup({required this.depth, required this.columns});

  @override
  Widget build(BuildContext context) {
    final items = techStackData.where((t) => t.depth == depth).toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DepthLabel(depth: depth),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 12.0;
              final itemWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: items
                    .map(
                      (t) => SizedBox(
                        width: itemWidth,
                        child: _TechCard(item: t),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DepthLabel extends StatelessWidget {
  final TechDepth depth;

  const _DepthLabel({required this.depth});

  Color _accentColor(TechDepth depth) {
    switch (depth) {
      case TechDepth.expert:
        return AppColors.primary;
      case TechDepth.proficient:
        return const Color(0xFF7C3AED);
      case TechDepth.familiar:
        return const Color(0xFF0891B2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _accentColor(depth);
    return Row(
      children: [
        Container(
          width: 3,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          depth.label,
          style: context.textTheme.bodyLarge?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 1,
            color: context.isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ],
    );
  }
}

class _TechCard extends StatefulWidget {
  final TechItem item;

  const _TechCard({required this.item});

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.primary.withOpacity(0.06) : (isDark ? AppColors.darkSurface : AppColors.lightSurface).withAlpha(0.5.alphaValue),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.primary.withOpacity(0.4) : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TechIcon(svgString: widget.item.svgIcon, hovered: _hovered),
            const SizedBox(height: 10),
            Text(
              widget.item.name,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                fontWeight: _hovered ? FontWeight.w600 : FontWeight.w400,
                color: _hovered ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final String svgString;
  final bool hovered;

  const _TechIcon({required this.svgString, required this.hovered});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final iconColor = hovered ? AppColors.primary : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary);

    if (svgString.isEmpty) {
      return Icon(
        Icons.code_rounded,
        size: 28,
        color: iconColor,
      );
    }

    return SvgPicture.string(
      svgString,
      width: 28,
      height: 28,
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
    );
  }
}
