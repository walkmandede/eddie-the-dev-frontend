import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/proud_work.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HighlightsPage extends StatelessWidget {
  const HighlightsPage({super.key});

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
          const SizedBox(height: 28),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: proudWorksData.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, i) => _HighlightCard(
              work: proudWorksData[i],
              index: i,
              onTap: () => _showDetail(context, proudWorksData[i]),
            ),
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
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 24) / 2;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: proudWorksData
                    .asMap()
                    .entries
                    .map(
                      (e) => SizedBox(
                        width: itemWidth,
                        child: _HighlightCard(
                          work: e.value,
                          index: e.key,
                          onTap: () => _showDetail(context, e.value),
                        ),
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

  void _showDetail(BuildContext context, ProudWork work) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _HighlightDetailSheet(work: work),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Highlights',
          style: context.textTheme.headlineLarge?.copyWith(fontSize: 32),
        ),
        const SizedBox(height: 8),
        Text(
          'Technical deep-dives into problems worth solving.',
          style: context.textTheme.bodyMedium?.copyWith(
            fontSize: 14,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }
}

class _HighlightCard extends StatefulWidget {
  final ProudWork work;
  final int index;
  final VoidCallback onTap;

  const _HighlightCard({
    required this.work,
    required this.index,
    required this.onTap,
  });

  @override
  State<_HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<_HighlightCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: (isDark ? AppColors.darkSurface : AppColors.lightSurface).withAlpha(0.5.alphaValue),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? AppColors.primary.withOpacity(0.5) : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.08),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _IndexBadge(index: widget.index),
                  const Spacer(),
                  Icon(
                    Icons.arrow_outward_rounded,
                    size: 18,
                    color: _hovered ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                widget.work.title,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.work.overview,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  height: 1.65,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'Read deep-dive',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  AnimatedSlide(
                    offset: _hovered ? const Offset(0.2, 0) : Offset.zero,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndexBadge extends StatelessWidget {
  final int index;

  const _IndexBadge({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary.withOpacity(0.25)),
      ),
      child: Center(
        child: Text(
          '0${index + 1}',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class _HighlightDetailSheet extends StatelessWidget {
  final ProudWork work;

  const _HighlightDetailSheet({required this.work});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(28, 24, 28, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    work.title,
                    style: context.textTheme.headlineLarge?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    work.overview,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      height: 1.7,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Divider(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                  const SizedBox(height: 24),
                  MarkdownBody(
                    data: work.content,
                    styleSheet: _buildMarkdownStyle(context, isDark),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  MarkdownStyleSheet _buildMarkdownStyle(BuildContext context, bool isDark) {
    final textTheme = context.textTheme;
    final primaryText = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryText = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return MarkdownStyleSheet(
      h2: textTheme.headlineMedium?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      p: textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        height: 1.75,
        color: primaryText,
      ),
      strong: textTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: primaryText,
      ),
      blockquote: textTheme.bodyMedium?.copyWith(
        fontSize: 14,
        height: 1.7,
        color: secondaryText,
        fontStyle: FontStyle.italic,
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.primary, width: 3),
        ),
        color: AppColors.primary.withOpacity(0.05),
      ),
      code: TextStyle(
        fontFamily: 'monospace',
        fontSize: 13,
        color: AppColors.primary,
        backgroundColor: AppColors.primary.withOpacity(0.08),
      ),
      codeblockDecoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      h2Padding: const EdgeInsets.only(top: 24, bottom: 8),
      blockquotePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
