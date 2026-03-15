import 'package:eddie_the_dev_frontend/core/data/contents/models/profile.dart';

final Profile profileData = Profile(
  name: "Kyaw Phyoe Han",
  title: "Senior Flutter Developer",
  location: "Bangkok, Thailand",
  email: "walkmandede@gmail.com",
  yearsOfExperience: 4,
  avatarUrl: "assets/profile/profile.jpg",
  bio: """

Hi! I'm Eddie. My real name is Kyaw Phyoe Han. I was originally from Yangon, Myanmar, currently living in Bangkok, Thailand.

I am a software engineer with experience building scalable applications across mobile, web, and backend systems. My work focuses on designing reliable software solutions, writing maintainable code, and solving complex technical problems.

Throughout my career, I have contributed to production systems such as ride-hailing platforms, internal management tools, and service-based applications. Some of the applications I have worked on have reached tens of thousands of users, including production apps with over 100K downloads on the Google Play Store.

I enjoy working across different layers of software development—from user interfaces to backend services and data systems—while continuously improving system performance, architecture, and user experience.

I am particularly interested in building well-structured systems, solving challenging engineering problems, and continuously learning new technologies to create practical and impactful software solutions.
""",
  aboutMe:
      """My first exposure to programming was during my first year at university. I studied Computer Science at the University of Computer Studies, Yangon. During that time, I started learning C++ as my first programming language and HTML + CSS for building web pages. In my second year, I continued studying programming with Java (J2SE).

In my third year, I had the opportunity to work as a backend developer intern at a company called Cloudsource, where I worked with Ruby on Rails. This experience gave me my first real exposure to professional software development.

In 2019, during my final year, the COVID-19 pandemic forced me to pause my education. During that period, I began learning mobile development using Java for Android. I developed two Android applications for a friend’s company: an Inventory Management System and an Attendance Recording System.

Later, my friend wanted to use these systems on his MacBook and iPhone as well. To make that possible, I started learning Flutter and rebuilt both applications as cross-platform apps. He also supported me by providing a MacBook and access to paid learning resources, which helped me learn and grow quickly. Because of his support, I was able to develop Flutter applications efficiently.

Within one year, I delivered an all-in-one customizable internal management application for his company, which was a local ISP in Yangon, Myanmar. The company’s main business was installing and servicing Wi-Fi networks for customers. The application included multiple features such as Attendance Recording, Inventory Management (stock and supply chains), Accounting, Periodic Reporting, and Operation Site Management.

In 2021, I joined a company called Xsphere in Yangon, Myanmar as a full-time developer. Initially, I focused on Flutter development, but later I expanded my skills by learning backend development with Node.js and contributing to backend systems.

After working at Xsphere for three years, I relocated to Bangkok in 2024 for several reasons and resumed my bachelor's degree after receiving approval from the University of Sunderland. During this time, I also worked as a freelancer on multiple projects and collaborated part-time with various companies.

In 2025, I successfully completed my Bachelor’s degree in Computer Science with First Class Honours.


Throughout my career, I have gained extensive experience in software development, including:

- Working within proper Software Development Life Cycles (SDLC)

- Designing custom UI components in Flutter using CustomPainter

- Implementing advanced animations using both implicit and explicit animation techniques

- Database design and integration using PostgreSQL, MySQL, MongoDB, Firebase, and Redis

- Backend development with Node.js


Some of my proudest achievements include:

- Developing a custom route-matching algorithm that significantly reduced my company’s dependency on Google APIs, lowering operational costs

- Building a 2D platform game called Against the Dark using the Flame game engine

- Creating a web service that extracts structured JSON information using Machine Learning

- Developing a regression-based AI model for a taxi-hailing application that predicts high-demand locations and times with 80–95% accuracy
""",
  specialties: [
    "Cross-platform Software Development with Flutter",
    "2D Game Development with Flame",
    "Backend Development with Node.js",
  ],
  socialLinks: [
    SocialLink(
      type: SocialType.github,
      url: "https://github.com/walkmandede",
    ),
    SocialLink(
      type: SocialType.linkedin,
      url: "https://linkedin.com/in/YOUR_LINKEDIN",
    ),
    SocialLink(
      type: SocialType.email,
      url: "mailto:walkmandede@gmail.com",
    ),
  ],
);
