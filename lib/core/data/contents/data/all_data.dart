import 'package:eddie_the_dev_frontend/core/constants/app_svgs.dart';
import 'package:eddie_the_dev_frontend/core/data/contents/models/tech_item.dart';

import '../models/achievement.dart';
import '../models/experience.dart';
import '../models/profile.dart';
import '../models/project.dart';
import '../models/proud_work.dart';

final Profile profileData = Profile(
  name: "Kyaw Phyoe Han (Eddie)",
  title: "Senior Flutter Developer · Full-Stack Developer",
  location: "Bangkok, Thailand",
  email: "kyawphyoehan2995@gmail.com",
  yearsOfExperience: 5,
  avatarUrl: "assets/profile/profile.jpg",
  bio: """I build production Flutter apps used by 100K+ users.
5 years shipping across mobile, backend, and full-stack Dart (Serverpod).
Based in Bangkok. BSc Computer Science, First Class Honours.""",
  aboutMe:
      """I started with C++ and Java at university, then moved into web development before landing my first professional role as a backend intern with Ruby on Rails.

During COVID, I built Android apps for a local business, which led me to Flutter — where I rebuilt those systems into cross-platform applications and delivered a full internal management system used in real operations.

I joined Xsphere as a full-time Flutter developer, where I spent three years shipping production systems at scale. The work that stands out: building Fary Taxi to 100K+ users, designing a custom in-house map routing engine to replace expensive third-party APIs, and mentoring junior developers while collaborating closely with backend engineers.

After relocating to Bangkok, I continued as a freelancer while completing my BSc in Computer Science with First Class Honours from the University of Sunderland.

I'm currently targeting full-time Flutter roles, and open to remote backend or full-stack Dart positions where my Node.js and Serverpod experience adds value.""",
  specialties: [
    "Production Flutter apps at scale (100K+ users)",
    "Full-stack Dart with Serverpod",
    "Backend integration with Node.js and REST APIs",
  ],
  socialLinks: [
    SocialLink(
      type: SocialType.github,
      url: "https://github.com/walkmandede",
    ),
    SocialLink(
      type: SocialType.linkedin,
      url: "https://linkedin.com/in/kyaw-phyoe-han-aba3b9255",
    ),
    SocialLink(
      type: SocialType.email,
      url: "mailto:walkmandede@gmail.com",
    ),
  ],
);

final List<Experience> experiencesData = [
  Experience(
    company: "Xsphere",
    position: "Mobile Developer",
    location: "Yangon, Myanmar",
    startDate: DateTime(2021, 12),
    endDate: DateTime(2024, 9),
    jobTypeEnum: JobTypeEnum.fullTime,
    jobNatureEnum: JobNatureEnum.onsite,
    description: [
      "Led mobile development of Fary Taxi, a ride-hailing platform that grew to 100K+ active users — coordinating task distribution and owning architecture decisions across the full app lifecycle.",
      "Designed and built a custom in-house map routing engine to eliminate dependency on expensive third-party APIs, reducing per-request cost to zero while cutting routing latency by ~40%.",
      "Improved overall app performance by ~30% and significantly reduced crash rates through targeted state management refactoring and optimized API handling.",
      "Built L2E Myanmar, an educational platform delivering localized video content to 800+ students with secure streaming and structured course management.",
      "Mentored 3 junior developers through code reviews and architectural guidance, raising code quality and reducing review cycles across the team.",
      "Partnered with backend engineers to identify N+1 query patterns and renegotiate API contracts, cutting response times by ~20%.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
      "Socket",
      "GraphQL",
      "Node.js",
      "TypeScript",
      "Firebase",
      "PostgreSQL",
      "MongoDB",
    ],
  ),

  Experience(
    company: "Phluid WorldWide",
    position: "Flutter Developer",
    location: "Singapore",
    startDate: DateTime(2024, 12),
    endDate: DateTime(2025, 9),
    jobTypeEnum: JobTypeEnum.partTime,
    jobNatureEnum: JobNatureEnum.remote,
    description: [
      "Contributed to Phluid Helpy and Hire Helpy — a two-sided job matching platform connecting domestic helpers with employers across Southeast Asia.",
      "Owned UI consistency across both helper and employer apps, ensuring pixel-level parity across Android and iOS on varied screen sizes.",
      "Built reusable component library that reduced duplication across the codebase and sped up feature delivery for the wider team.",
      "Delivered new features under tight product deadlines within an international cross-functional team spanning multiple time zones.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Clean Architecture",
      "REST API",
    ],
  ),

  Experience(
    company: "Vinculor",
    position: "Dart Full-Stack Developer",
    location: "Vietnam",
    startDate: DateTime(2025, 7),
    endDate: DateTime(2026, 3),
    jobTypeEnum: JobTypeEnum.fullTime,
    jobNatureEnum: JobNatureEnum.remote,
    description: [
      "Built and maintained full-stack features using Flutter on the client and Serverpod on the server — one of the few production teams using Dart end-to-end.",
      "Designed and implemented real-time communication features between client and server, improving responsiveness and reducing polling overhead.",
      "Integrated and optimized PostgreSQL database layers for secure, high-performance data handling at the application level.",
      "Translated business requirements into reliable technical solutions in close collaboration with senior engineers, shipping production-grade code consistently.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Serverpod",
      "PostgreSQL",
      "REST API",
      "Real-time systems",
    ],
  ),

  Experience(
    company: "Pg1.ai",
    position: "Flutter Developer",
    location: "UK",
    startDate: DateTime(2025, 12),
    endDate: DateTime(2026, 2),
    jobTypeEnum: JobTypeEnum.projectBased,
    jobNatureEnum: JobNatureEnum.remote,
    description: [
      "Designed and built a psychological assessment engine that converts user responses across 12 scenario cards into 9-dimensional personality trait vectors.",
      "Implemented a vector-based compatibility scoring system using weighted behavioural (EI) and cognitive (CI) signals, with Euclidean distance matching against predefined archetype centroids — replacing what would otherwise have been a naive scoring approach.",
      "Built a modular JSON-driven configuration system allowing weight tables, centroids, and narrative content to be updated without touching core logic — making the engine research-friendly and easy to recalibrate.",
      "Created deterministic diagnostic utilities to validate scoring distribution fairness and centroid reachability, ensuring the algorithm behaved correctly across all input combinations.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Algorithm Design",
      "Vector Mathematics",
      "Euclidean Distance Matching",
      "JSON Data Modeling",
      "Modular Architecture",
    ],
  ),
];

final List<Project> projectsData = [
  Project(
    name: "Fary Taxi",
    overview:
        "A large-scale ride-hailing platform serving 100K+ users across Myanmar. Includes separate apps for passengers and drivers with real-time booking, navigation, and a custom in-house routing engine built to eliminate third-party API costs at scale.",
    badges: [
      '100K+ Users',
      'Featured',
    ],
    highlights: [
      "Led the mobile development team and owned architecture decisions across the full app lifecycle.",
      "Built a custom in-house map routing engine — eliminating expensive third-party API costs and reducing routing latency by ~40%.",
      "Improved app performance by ~30% and reduced crash rates through state management refactoring and optimized API handling.",
      "Shipped separate passenger and driver apps, both live on Play Store and App Store.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
      "Maps",
      "Firebase",
      "Socket",
    ],
    isFeatured: true,
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "User App - Play Store",
        url: "https://play.google.com/store/apps/details?id=com.xsphere.fary_taxi_enduser",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "User App - App Store",
        url: "https://apps.apple.com/mm/app/fary-ready-to-deliver/id1669442797",
      ),
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Driver App - Play Store",
        url: "https://play.google.com/store/apps/details?id=com.xsphere.fary_taxi_driver",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "Driver App - App Store",
        url: "https://apps.apple.com/mm/app/fary-driver/id1671354074",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550385/460x0w_b70qyx.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_3_u0bf2r.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_2_xp6v1f.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_1_stw5c4.webp',
    ],
  ),

  Project(
    name: "Phluid Helpy & Hire Helpy",
    overview:
        "A two-sided job matching platform connecting domestic helpers with employers across Southeast Asia. Uses a proprietary AI-based matching algorithm and provides a community space for communication and support.",
    badges: ['Live on App Store', 'Live on Play Store'],
    highlights: [
      "Owned UI consistency across both helper and employer apps on Android and iOS.",
      "Built a reusable component library that reduced duplication and sped up feature delivery.",
      "Integrated REST APIs with backend services in an international agile team.",
      "Optimized Flutter performance and improved responsiveness across device sizes.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
      "Clean Architecture",
      "Git",
    ],
    isFeatured: true,
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Helpy - Play Store",
        url: "https://play.google.com/store/apps/details?id=com.phluid.dh.mobile&hl=en",
      ),
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Hire Helpy - Play Store",
        url: "https://play.google.com/store/apps/details?id=com.phluid.dh.employer",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "Helpy - App Store",
        url: "https://apps.apple.com/sg/app/phluid-helpy/id6461165550",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "Hire Helpy - App Store",
        url: "https://apps.apple.com/us/app/phluid-hire-helpy/id6459793048",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550389/unnamed_2_c3rt2q.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550388/unnamed_3_bw9kpu.webp',
    ],
  ),

  Project(
    name: "Car Crash List",
    overview:
        "A mobile application aggregating and displaying car crash incidents in Myanmar. Reached 50K+ downloads organically by providing reliable, fast access to incident data in an accessible interface.",
    badges: ['50K+ Downloads'],
    highlights: [
      "Reached 50K+ downloads on Google Play through organic discovery.",
      "Built an intuitive browsing interface for quick incident lookup.",
      "Integrated backend APIs for efficient and up-to-date data retrieval.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Play Store",
        url: "https://play.google.com/store/apps/details?id=com.kphkph.car_crash_list",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550389/unnamed_ccmae6.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550386/unnamed_1_bvblpr.webp',
    ],
  ),

  Project(
    name: "L2E Myanmar",
    overview:
        "A mobile learning platform connecting students with top educators across Myanmar. Delivers secure video-based learning with structured courses and protected content to 800+ active students.",
    badges: ['800+ Students'],
    highlights: [
      "Implemented secure video streaming with content protection to prevent unauthorized access.",
      "Designed course browsing and learning interfaces focused on low-friction student experience.",
      "Deployed and maintained the platform serving 800+ students in production.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Video Streaming",
      "REST API",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Play Store",
        url: "https://play.google.com/store/apps/details?id=com.xsphere.e_learning",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "App Store",
        url: "https://apps.apple.com/mm/app/l2e-myanmar/id1626038880",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_6_stu3gp.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_5_fvih3x.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_7_uyvims.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_4_oijg53.webp',
    ],
  ),

  Project(
    name: "Shwe Pann Thee",
    badges: ['Video Streaming', '5K+ Downloads'],
    overview: "A video streaming mobile platform with a custom-built video player and a reels feed driven by a user-centralized recommendation algorithm.",
    highlights: [
      "Built a custom video player with smooth playback and full screen support.",
      "Implemented a reels-style feed with a user-centralized content algorithm.",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Play Store",
        url: "https://play.google.com/store/apps/details?id=com.kphkph.shwe_pann_thee",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550388/unnamed_5_lewij7.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550388/unnamed_4_vl7diq.webp',
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Laravel",
      "PHP",
      "Video Streaming",
      "REST API",
    ],
  ),

  Project(
    name: "Against the Dark",
    overview:
        "A 2D platformer game built with Flutter and Flame. Players switch between 4 characters with unique abilities, navigating a world of complete darkness where light is the core mechanic. Playable in browser.",
    highlights: [
      "Implemented 2D physics using the Flame game engine.",
      "Designed a light-as-resource mechanic across multiple characters with distinct abilities.",
      "Deployed as a browser-playable web app via Vercel.",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.website,
        label: "Play in Browser",
        url: "https://againstthedark.vercel.app/",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773549067/2569-03-15_11.30.54_n3pedt.jpg',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773549067/2569-03-15_11.30.52_o2mofh.jpg',
    ],
    technologies: ["Flutter", "Dart", "Flame", "Firebase"],
  ),

  Project(
    name: "QQ Studio Retail System",
    overview:
        "A full retail management system for a fashion shop in Yangon — covering customer-facing mobile shopping, cashier POS, and admin inventory management in a single Flutter codebase across mobile and desktop.",
    highlights: [
      "Built mobile shopping app for customers and desktop POS app for cashiers from a single codebase.",
      "Developed admin panel for inventory management and sales reporting.",
      "Digitalized end-to-end retail workflows, replacing manual processes.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "Desktop Apps",
      "POS Systems",
    ],
    metas: [],
    screenshots: [],
  ),

  Project(
    name: "Xsphere Internal HR System",
    overview:
        "An internal HR platform built to digitalize attendance, leave management, and employee tracking for Xsphere's operations — replacing spreadsheet-based processes.",
    highlights: [
      "Built mobile check-in/check-out system with QR code attendance tracking.",
      "Implemented leave request and approval workflow.",
      "Replaced manual HR record-keeping with a fully digital system.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "QR System",
      "REST API",
    ],
    metas: [],
    screenshots: [],
  ),

  Project(
    name: "The Beast Gym",
    overview:
        "A mobile app for gym members to manage their fitness journey — booking trainers, purchasing packages, and tracking attendance through a seamless check-in system.",
    highlights: [
      "Built trainer booking and package purchasing flows end-to-end.",
      "Implemented QR-based attendance check-in and check-out.",
      "Shipped on both Play Store and App Store.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Play Store",
        url: "https://play.google.com/store/apps/details?id=com.xsphere.the_beast_gym_end_user",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "App Store",
        url: "https://apps.apple.com/mm/app/the-beast/id6470431862",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550385/460x0w_9_rudco0.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550385/460x0w_10_ekoc3s.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550384/460x0w_8_vtklsm.webp',
    ],
  ),

  Project(
    name: "Sanpya Express",
    overview:
        "A comprehensive eCommerce system supporting both online and in-store shopping with dedicated apps for customers, sales staff, cashiers, and admins — all built in Flutter.",
    highlights: [
      "Built four separate role-based apps (customer, sales, cashier, admin) from a shared Flutter codebase.",
      "Designed inventory management and transaction workflows for in-store operations.",
      "Deployed to both Play Store and App Store.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "eCommerce Systems",
      "REST API",
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.playStore,
        label: "Play Store",
        url: "https://play.google.com/store/apps/details?id=com.xsphere.sanpya_express_user",
      ),
      ProjectMeta(
        type: ProjectMetaType.appStore,
        label: "App Store",
        url: "https://apps.apple.com/mm/app/san-pya/id6479732045",
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550385/460x0w_11_ersl8n.webp',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773550385/460x0w_12_frbj6c.webp',
    ],
  ),
];

final List<Achievement> achievementsData = [
  Achievement(
    name: 'Bachelor of Science in Computer Science',
    issuer: 'University of Sunderland',
    issuedDate: DateTime(2025, 3),
    credentialUrl: '',
    imageUrl: 'https://res.cloudinary.com/dgajyuay4/image/upload/v1773573477/1757722750917_fhzyfv.jpg',
    newSkills: [
      'Project Management — SDLC, project planning, milestone tracking, and delivery management.',
    ],
    improvedSkills: [
      'Database Management — PostgreSQL and MongoDB, including schema design, normalization, indexing, and query optimization.',
      'Android Development (Java) — UI components, activity/fragment lifecycle, and data persistence.',
    ],
  ),
  Achievement(
    name: "Advanced Flutter: Build Enterprise-Ready Apps",
    issuer: "Udemy",
    issuedDate: DateTime(2025, 8),
    credentialUrl: "https://www.udemy.com/certificate/UC-8df60fe8-cOb4-4cc7-a7c8-4ce9e59c1b37/",
    imageUrl: 'https://res.cloudinary.com/dgajyuay4/image/upload/v1773573477/1755619056275_pmjqle.jpg',
    newSkills: [
      'Riverpod — clearer and more scalable state management',
      'Flutter Hooks — simplifying widget lifecycles',
      'Mason Bricks — faster project scaffolding with templates',
      'CI/CD with Codemagic — automating builds and deployments',
    ],
    improvedSkills: [
      'Clean Architecture — moved from layer-first only to knowing when to apply feature-first',
      'GoRouter — redirects, shell routes, and auth guards',
      'Flavor Management — proper multi-environment Flutter setup',
      'Error Handling — from manual to a reusable, structured approach',
    ],
  ),
  Achievement(
    name: 'Create a Back-End App with JavaScript Skill Path',
    issuer: 'Codecademy',
    issuedDate: DateTime(2025, 4),
    credentialUrl: '',
    imageUrl: 'https://res.cloudinary.com/dgajyuay4/image/upload/v1773573871/2569-03-15_18.24.16_niuo03.jpg',
    newSkills: [
      'Node.js',
      'TypeScript',
      'PostgreSQL',
      'Socket.io',
      'RESTful API design',
    ],
  ),
];

final List<ProudWork> proudWorksData = [
  ProudWork(
    title: 'Custom Map Routing Engine',
    overview:
        'Built an in-house routing algorithm to replace expensive third-party map services in Fary Taxi, serving 100K+ users without per-request licensing costs.',
    images: [],
    content: '''
## The problem
Third-party routing APIs were expensive at scale and introduced latency we couldn't control. At 100K+ active users, the cost was becoming a real constraint on unit economics.

## The approach
I designed a graph-based routing engine using local road segment data, weighted by real-time traffic signals delivered via socket updates. The engine handled route calculation entirely on our infrastructure, with no external API calls in the critical path.

## The tradeoffs
We gave up turn-by-turn voice guidance in the first version — that relied on third-party data we were replacing. The wins: zero per-request cost, ~40% lower routing latency, and full control over the matching heuristic for Myanmar's local road network where global map data is often incomplete or outdated.

## The outcome
The engine shipped to production and handled routing for 100K+ users. It became the foundation for further improvements including traffic-aware re-routing and driver-side ETA accuracy.
''',
  ),
  ProudWork(
    title: 'Psychological Scoring Engine',
    overview:
        'Designed a vector-based personality assessment engine for Pg1.ai that converts user responses into 9-dimensional trait profiles and evaluates compatibility using Euclidean distance matching.',
    images: [],
    content: '''
## The problem
A naive scoring approach — summing or averaging response values — couldn't capture the multi-dimensional nature of personality compatibility. The client needed an engine that could map user behaviour to defined archetypes reliably and be recalibrated without code changes.

## The approach
I designed a scoring system where each user response contributes weighted signals across two axes: behavioural (EI) and cognitive interpretation (CI). Responses across 12 scenario cards are aggregated into a 9-dimensional trait vector, then compared against predefined archetype centroids using Euclidean distance to find the closest personality match.

## The modular config system
All weight tables, centroids, and narrative content are loaded from JSON at runtime. This means researchers can recalibrate the model — adjusting weights or adding new archetypes — without touching any Dart code. The engine reads config, the engine doesn't embed it.

## Validation
I built deterministic test utilities to verify that every archetype centroid was reachable given valid input combinations, that scoring distributions were fair across the input space, and that the Euclidean matching produced consistent results. This was essential for a psychological tool where scoring errors aren't just bugs — they're wrong answers about people.
''',
  ),
];

final List<TechItem> techStackData = [
  TechItem(name: 'Flutter', svgIcon: AppSvgs.flutterLogo, depth: TechDepth.expert),
  TechItem(name: 'Dart', svgIcon: AppSvgs.dartLogo, depth: TechDepth.expert),
  TechItem(name: 'REST API', svgIcon: AppSvgs.backendDevelopmentLogo, depth: TechDepth.expert),
  TechItem(name: 'Firebase', svgIcon: AppSvgs.firebaseLogo, depth: TechDepth.expert),
  TechItem(name: 'Clean Architecture', svgIcon: AppSvgs.softwareSkillLogo, depth: TechDepth.expert),
  TechItem(name: 'Node.js', svgIcon: AppSvgs.nodejsLogo, depth: TechDepth.proficient),
  TechItem(name: 'TypeScript', svgIcon: AppSvgs.typescriptLogo, depth: TechDepth.proficient),
  TechItem(name: 'PostgreSQL', svgIcon: AppSvgs.databaseManagementLogo, depth: TechDepth.proficient),
  TechItem(name: 'MongoDB', svgIcon: AppSvgs.databaseManagementLogo, depth: TechDepth.proficient),
  TechItem(name: 'Serverpod', svgIcon: AppSvgs.dartLogo, depth: TechDepth.proficient),
  TechItem(name: 'GraphQL', svgIcon: AppSvgs.graphqlLogo, depth: TechDepth.proficient),
  TechItem(name: 'Socket.io', svgIcon: AppSvgs.socketLogo, depth: TechDepth.proficient),
  TechItem(name: 'Python', svgIcon: AppSvgs.pythonLogo, depth: TechDepth.familiar),
  TechItem(name: 'Java', svgIcon: AppSvgs.javaLogo, depth: TechDepth.familiar),
  TechItem(name: 'TensorFlow', svgIcon: AppSvgs.machineLearningLogo, depth: TechDepth.familiar),
  TechItem(name: 'Flame', svgIcon: AppSvgs.flutterLogo, depth: TechDepth.familiar),
  TechItem(name: 'CI/CD', svgIcon: AppSvgs.softwareSkillLogo, depth: TechDepth.familiar),
];
