enum JobTypeEnum {
  fullTime(label: 'Full Time'),
  partTime(label: 'Part Time'),
  projectBased(label: 'Project Based');

  final String label;
  const JobTypeEnum({required this.label});
}

enum JobNatureEnum {
  onsite(label: 'Onsite'),
  remote(label: 'Remote'),
  hybrid(label: 'Hybrid');

  final String label;
  const JobNatureEnum({required this.label});
}

class Experience {
  final String company;
  final String position;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> description;
  final List<String> technologies;
  final JobTypeEnum jobTypeEnum;
  final JobNatureEnum jobNatureEnum;

  const Experience({
    required this.company,
    required this.position,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.technologies,
    required this.jobNatureEnum,
    required this.jobTypeEnum,
  });
}
