import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/experience.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  int _selectedIndex = 0;

  List<Experience> get _sorted => [...experiencesData]..sort((a, b) => b.startDate.compareTo(a.startDate));

  @override
  Widget build(BuildContext context) {
    return context.isVertical() ? _vLayout(context) : _hLayout(context);
  }

  Widget _vLayout(BuildContext context) {
    final sorted = _sorted;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      itemCount: sorted.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return _MobileExperienceCard(experience: sorted[index]);
      },
    );
  }

  Widget _hLayout(BuildContext context) {
    final sorted = _sorted;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(text: 'Experience'),
          const SizedBox(height: 48),
          ...List.generate(sorted.length, (index) {
            final isLast = index == sorted.length - 1;
            return _TimelineRow(
              experience: sorted[index],
              isLast: isLast,
              isSelected: _selectedIndex == index,
              onTap: () => setState(() => _selectedIndex = index),
              isDark: isDark,
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatefulWidget {
  final Experience experience;
  final bool isLast;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const _TimelineRow({
    required this.experience,
    required this.isLast,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  State<_TimelineRow> createState() => _TimelineRowState();
}

class _TimelineRowState extends State<_TimelineRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 260,
                child: Padding(
                  padding: const EdgeInsets.only(right: 32, bottom: 40),
                  child: _CompanyInfo(
                    experience: widget.experience,
                    isDark: widget.isDark,
                  ),
                ),
              ),
              _TimelineSpine(
                isLast: widget.isLast,
                isSelected: widget.isSelected || _hovered,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 32, bottom: 40),
                  child: _DescriptionCard(
                    experience: widget.experience,
                    isSelected: widget.isSelected,
                    isDark: widget.isDark,
                    hovered: _hovered,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineSpine extends StatelessWidget {
  final bool isLast;
  final bool isSelected;

  const _TimelineSpine({
    required this.isLast,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primary : AppColors.primary.withAlpha(0.25.alphaValue),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withAlpha((0.35.alphaValue)),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
          ),

          if (!isLast)
            Expanded(
              child: Container(
                width: 1,
                color: Theme.of(context).dividerColor,
              ),
            ),
        ],
      ),
    );
  }
}

class _CompanyInfo extends StatelessWidget {
  final Experience experience;
  final bool isDark;

  const _CompanyInfo({required this.experience, required this.isDark});

  String _formatDate(DateTime? date) {
    if (date == null) return 'Present';
    return DateFormat('MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          experience.company,
          textAlign: TextAlign.right,
          style: textTheme.headlineMedium?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 6),
        Text(
          '${_formatDate(experience.startDate)} – ${_formatDate(experience.endDate)}',
          style: textTheme.bodyMedium?.copyWith(fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(
          '${experience.location} · ${experience.jobNatureEnum.label} · ${experience.jobTypeEnum.label}',
          textAlign: TextAlign.right,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontFamily: AppTheme.fontNunito,
          ),
        ),
      ],
    );
  }
}

class _DescriptionCard extends StatelessWidget {
  final Experience experience;
  final bool isSelected;
  final bool isDark;
  final bool hovered;

  const _DescriptionCard({
    required this.experience,
    required this.isSelected,
    required this.isDark,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final borderColor = isSelected || hovered ? AppColors.primary.withAlpha(0.4.alphaValue) : (isDark ? AppColors.darkBorder : AppColors.lightBorder);
    final cardColor = isSelected
        ? (isDark ? AppColors.darkSurface.withAlpha(0.75.alphaValue) : AppColors.primary.withAlpha(0.04.alphaValue))
        : hovered
        ? (isDark ? AppColors.darkSurface.withAlpha(0.9.alphaValue) : AppColors.primary.withAlpha(0.03.alphaValue))
        : surfaceColor.withAlpha(0.3.alphaValue);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: hovered && !isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withAlpha(0.06.alphaValue),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.position,
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          ...experience.description.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 10),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 14,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.65,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: experience.technologies.map((tech) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(0.08.alphaValue),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.primary.withAlpha(0.2.alphaValue),
                  ),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: AppTheme.fontNunito,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MobileExperienceCard extends StatelessWidget {
  final Experience experience;

  const _MobileExperienceCard({required this.experience});

  String _formatDate(DateTime? date) {
    if (date == null) return 'Present';
    return DateFormat('MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkSurface : AppColors.lightSurface).withAlpha(0.5.alphaValue),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textTheme.headlineMedium?.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            experience.position,
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_formatDate(experience.startDate)} – ${_formatDate(experience.endDate)} · ${experience.location}',
            style: textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 16),
          ...experience.description.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 8),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: 14,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        height: 1.65,
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

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 32),
    );
  }
}
