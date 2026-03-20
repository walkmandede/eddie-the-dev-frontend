import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/project.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/double_extension.dart';
import 'package:eddie_the_dev_frontend/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

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
          const _SectionLabel(text: 'Projects'),
          const SizedBox(height: 28),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projectsData.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, i) => _CompactProjectCard(
              project: projectsData[i],
              onTap: () => _showDetail(context, projectsData[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hLayout(BuildContext context) {
    final featured = projectsData.where((p) => p.isFeatured).toList();
    final others = projectsData.where((p) => !p.isFeatured).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel(text: 'Projects'),
          const SizedBox(height: 40),
          const _SubLabel(text: 'Featured'),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: featured
                .map(
                  (p) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: featured.indexOf(p) < featured.length - 1 ? 20 : 0,
                      ),
                      child: _FeaturedProjectCard(
                        project: p,
                        onTap: () => _showDetail(context, p),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 48),
          const _SubLabel(text: 'More Projects'),
          const SizedBox(height: 20),
          _ProjectGrid(
            projects: others,
            onTap: (p) => _showDetail(context, p),
          ),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, Project project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _ProjectDetailSheet(project: project),
    );
  }
}

class _FeaturedProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const _FeaturedProjectCard({required this.project, required this.onTap});

  @override
  State<_FeaturedProjectCard> createState() => _FeaturedProjectCardState();
}

class _FeaturedProjectCardState extends State<_FeaturedProjectCard> {
  int _screenshotIndex = 0;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: (isDark ? AppColors.darkSurface : AppColors.lightSurface).withAlpha(0.7.alphaValue),
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
              if (p.screenshots.isNotEmpty)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      children: [
                        Image.network(
                          p.screenshots[_screenshotIndex],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                          ),
                        ),
                        if (p.screenshots.length > 1)
                          Positioned(
                            bottom: 10,
                            right: 12,
                            child: _ScreenshotDots(
                              count: p.screenshots.length,
                              current: _screenshotIndex,
                              onTap: (i) => setState(() => _screenshotIndex = i),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (p.badges.isNotEmpty) ...[
                      Wrap(
                        spacing: 6,
                        children: p.badges.map((b) => _Badge(label: b)).toList(),
                      ),
                      const SizedBox(height: 12),
                    ],
                    Text(
                      p.name,
                      style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      p.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: p.technologies.map((t) => _TechTag(label: t)).toList(),
                    ),
                    if (p.metas.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: p.metas.map((m) => _MetaLink(meta: m)).toList(),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'View details',
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
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<Project> onTap;

  const _ProjectGrid({required this.projects, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 800 ? 3 : 2;
        final itemWidth = (constraints.maxWidth - (columns - 1) * 16) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: projects
              .map(
                (p) => SizedBox(
                  width: itemWidth,
                  child: _CompactProjectCard(
                    project: p,
                    onTap: () => onTap(p),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _CompactProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const _CompactProjectCard({required this.project, required this.onTap});

  @override
  State<_CompactProjectCard> createState() => _CompactProjectCardState();
}

class _CompactProjectCardState extends State<_CompactProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
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
              if (p.badges.isNotEmpty) ...[
                Wrap(
                  spacing: 6,
                  children: p.badges.map((b) => _Badge(label: b)).toList(),
                ),
                const SizedBox(height: 10),
              ],
              Text(
                p.name,
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                p.overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: p.technologies.take(3).map((t) => _TechTag(label: t)).toList(),
              ),
              if (p.metas.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: p.metas.take(2).map((m) => _MetaLink(meta: m)).toList(),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'View details',
                    style: TextStyle(
                      fontSize: 12,
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
                      size: 13,
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

class _ProjectDetailSheet extends StatefulWidget {
  final Project project;

  const _ProjectDetailSheet({required this.project});

  @override
  State<_ProjectDetailSheet> createState() => _ProjectDetailSheetState();
}

class _ProjectDetailSheetState extends State<_ProjectDetailSheet> {
  int _screenshotIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;
    final p = widget.project;

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.lightBackground).withAlpha(0.8.alphaValue),
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
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (p.screenshots.isNotEmpty) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: context.screenHeight() * 0.5,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.network(
                                p.screenshots[_screenshotIndex],
                                fit: BoxFit.contain,
                              ),
                            ),
                            if (p.screenshots.length > 1) ...[
                              Positioned(
                                left: 8,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: _NavButton(
                                    icon: Icons.chevron_left,
                                    onTap: () => setState(() {
                                      _screenshotIndex = (_screenshotIndex - 1 + p.screenshots.length) % p.screenshots.length;
                                    }),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: _NavButton(
                                    icon: Icons.chevron_right,
                                    onTap: () => setState(() {
                                      _screenshotIndex = (_screenshotIndex + 1) % p.screenshots.length;
                                    }),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: _ScreenshotDots(
                                    count: p.screenshots.length,
                                    current: _screenshotIndex,
                                    onTap: (i) => setState(() => _screenshotIndex = i),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (p.badges.isNotEmpty) ...[
                    Wrap(
                      spacing: 6,
                      children: p.badges.map((b) => _Badge(label: b)).toList(),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Text(
                    p.name,
                    style: textTheme.headlineLarge?.copyWith(fontSize: 26),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    p.overview,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                  if (p.highlights.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Highlights',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...p.highlights.map(
                      (h) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 6, right: 10),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                size: 14,
                                color: AppColors.primary,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                h,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Text(
                    'Tech Stack',
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: p.technologies.map((t) => _TechTag(label: t)).toList(),
                  ),
                  if (p.metas.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      'Links',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: p.metas.map((m) => _MetaLink(meta: m)).toList(),
                    ),
                  ],
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenshotDots extends StatelessWidget {
  final int count;
  final int current;
  final ValueChanged<int> onTap;

  const _ScreenshotDots({
    required this.count,
    required this.current,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) {
        return GestureDetector(
          onTap: () => onTap(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == current ? 16 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == current ? AppColors.primary : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;

  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;

  const _TechTag({required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
        ),
      ),
    );
  }
}

class _MetaLink extends StatelessWidget {
  final ProjectMeta meta;

  const _MetaLink({required this.meta});

  IconData get _icon {
    switch (meta.type) {
      case ProjectMetaType.playStore:
        return Icons.shop_outlined;
      case ProjectMetaType.appStore:
        return Icons.apple;
      case ProjectMetaType.github:
        return Icons.code;
      case ProjectMetaType.website:
      case ProjectMetaType.link:
        return Icons.open_in_new;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(_icon, size: 13, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              meta.label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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

class _SubLabel extends StatelessWidget {
  final String text;
  const _SubLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontSize: 13,
        letterSpacing: 1.2,
      ),
    );
  }
}
