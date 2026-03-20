enum TechDepth {
  expert(label: 'Expert'),
  proficient(label: 'Proficient'),
  familiar(label: 'Familiar');

  final String label;
  const TechDepth({required this.label});
}

class TechItem {
  final String name;
  final String svgIcon;
  final TechDepth depth;

  const TechItem({
    required this.name,
    required this.svgIcon,
    required this.depth,
  });
}
