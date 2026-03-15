class Achievement {
  final String name;
  final String issuer;
  final DateTime issuedDate;
  final String credentialUrl;
  final String? credentialId;
  final String? imageUrl;
  final String? remark;
  final List<String> newSkills;
  final List<String> improvedSkills;

  const Achievement({
    required this.name,
    required this.issuer,
    required this.issuedDate,
    required this.credentialUrl,
    this.credentialId,
    this.imageUrl,
    this.remark,
    this.newSkills = const [],
    this.improvedSkills = const [],
  });
}
