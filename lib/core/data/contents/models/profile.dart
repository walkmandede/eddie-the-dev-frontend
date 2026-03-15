class Profile {
  final String name;
  final String title;
  final String location;
  final String email;
  final String bio;
  final String aboutMe;
  final String avatarUrl;
  final List<SocialLink> socialLinks;
  final List<String> specialties;
  final int yearsOfExperience;

  const Profile({
    required this.name,
    required this.title,
    required this.location,
    required this.email,
    required this.bio,
    required this.aboutMe,
    required this.avatarUrl,
    required this.socialLinks,
    required this.specialties,
    required this.yearsOfExperience,
  });
}

class SocialLink {
  final SocialType type;
  final String url;

  const SocialLink({
    required this.type,
    required this.url,
  });
}

enum SocialType {
  github,
  linkedin,
  email,
}
