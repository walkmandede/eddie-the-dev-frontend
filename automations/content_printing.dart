import 'package:eddie_the_dev_frontend/core/data/contents/data/all_data.dart';

void main() async {
  final content = await printContent();
  print(content);
}

Future<String> printContent() async {
  String rawContent = '';

  // Profile Section
  rawContent += 'Profile Section\n\n';
  rawContent += '${profileData.name}\n';
  rawContent += '${profileData.title}\n';
  rawContent += '${profileData.bio}\n';
  rawContent += '${profileData.aboutMe}\n\n';

  // Experience Section
  rawContent += 'Experience Section\n\n';
  for (final e in experiencesData) {
    rawContent += '${e.company}\n';
    rawContent += 'From ${e.startDate} to ${e.endDate ?? 'present'}\n';
    rawContent += '${e.location}\n';
    rawContent += '${e.jobNatureEnum.label}\n';
    rawContent += '${e.jobTypeEnum.label}\n';
    rawContent += '${e.description}\n';
    rawContent += '----\n';
  }

  rawContent += '\n';

  // Projects Section
  rawContent += 'Projects Section\n\n';
  for (final p in projectsData) {
    rawContent += '${p.name}\n';
    rawContent += '${p.overview}\n';
    rawContent += '${p.badges}\n';
    rawContent += '${p.highlights}\n';
    rawContent += '${p.technologies}\n';
    rawContent += '[There will be some screenshots]\n';
    rawContent += '[There will be some links like storedownload or website redirect]\n';
    rawContent += '---\n';
  }

  // Achievement Section
  rawContent += 'Achievement Section\n\n';
  for (final a in achievementsData) {
    rawContent += '${a.name}\n';
    rawContent += '${a.issuer}\n';
    rawContent += '${a.issuedDate}\n';
    rawContent += '${a.newSkills}\n';
    rawContent += '${a.improvedSkills}\n';
    rawContent += '[There is a image for the certificate here]\n';
    rawContent += '------\n';
  }

  rawContent += '\n';

  return rawContent;
}
