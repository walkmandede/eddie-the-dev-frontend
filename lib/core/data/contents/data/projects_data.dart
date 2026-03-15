import '../models/project.dart';

final List<Project> projectsData = [
  Project(
    name: "Fary Taxi Application",
    overview:
        "Fary Taxi is a large-scale ride-hailing platform providing seamless transportation services for users and drivers. The platform includes separate applications for passengers and drivers, supporting real-time booking and navigation.",
    badges: [
      '100K+ Downloads',
      'Featured',
    ],
    highlights: [
      "Led the mobile development team and coordinated task distribution.",
      "Successfully launched the application with more than 100,000 active users.",
      "Developed a custom in-house map routing system to reduce dependency on expensive third-party services.",
      "Improved performance and stability through optimization and crash monitoring.",
    ],
    technologies: [
      "Flutter",
      "Dart",
      "REST API",
      "Maps",
      "Firebase",
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
    name: "Car Crash List",
    overview: "A mobile application designed to track and display car crash incidents in an organized and accessible way for users.",
    highlights: [
      "Built intuitive interface for browsing crash data.",
      "Implemented backend integration for fast data retrieval.",
      "Published the application on Google Play Store.",
    ],
    badges: ['50K+ Downloads', 'Reliable Source'],
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
    name: "Phluid Helpy & Hire Helpy",
    overview:
        "Phluid Helpy is a mobile platform that connects domestic helpers with employers through a transparent and safe job matching process. The system uses a proprietary AI-based matching algorithm to recommend the most suitable employer-helper matches while also providing a community space for communication and support.",
    highlights: [
      "Developed and maintained core mobile features using Flutter.",
      "Implemented responsive UI for both helper and employer applications.",
      "Collaborated with backend engineers to integrate REST APIs.",
      "Optimized app performance and improved user experience.",
      "Participated in international team collaboration and agile development.",
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
    name: 'Shwe Pann Thee',
    badges: ['Video Streaming', '5K+ download'],
    overview: 'The mobile platform application for Shwe Pann Thee Users',
    highlights: [
      'Implemented custom video player',
      'Reels player with user-centralized algorithm',
    ],
    metas: [ProjectMeta(type: ProjectMetaType.playStore, label: 'Playstore', url: 'https://play.google.com/store/apps/details?id=com.kphkph.shwe_pann_thee')],
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
    name: "L2E Myanmar Mobile Learning Platform",
    overview:
        "L2E Myanmar is a mobile learning platform designed to connect students with top educators across Myanmar. The app enables secure video-based learning with structured courses and interactive educational content.",
    highlights: [
      "Developed a scalable mobile learning platform using Flutter.",
      "Implemented secure video streaming and content protection.",
      "Designed user-friendly course browsing and learning interfaces.",
      "Successfully deployed the platform serving more than 800 students.",
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
    name: 'Aginst the Dark',
    overview:
        'Against the Dark is a 2D-platform game that lets players switch between 4 characters, each with unique abilities. The whole world is in complete darkness, and light is your most valuable resource. You win by reaching the goal while avoiding obstacles along the way.',
    highlights: [
      'Appliance of 2D phyics',
    ],
    metas: [
      ProjectMeta(
        type: ProjectMetaType.website,
        label: 'Click here to play',
        url: 'https://againstthedark.vercel.app/',
      ),
    ],
    screenshots: [
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773549067/2569-03-15_11.30.54_n3pedt.jpg',
      'https://res.cloudinary.com/dgajyuay4/image/upload/v1773549067/2569-03-15_11.30.52_o2mofh.jpg',
    ],
    technologies: ['Flutter', 'Dart', 'Flame', 'Firebase'],
  ),

  Project(
    name: "QQ Studio Retail System",
    overview:
        "A retail management system developed for a fashion shop in Yangon. The system includes a mobile shopping application and desktop applications for cashier and admin management.",
    highlights: [
      "Built a mobile shopping application for customers.",
      "Developed desktop cashier and admin applications for inventory and sales management.",
      "Improved retail operation efficiency through digitalized workflows.",
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
    overview: "An internal company application designed to digitalize HR operations and track employee activities efficiently.",
    highlights: [
      "Developed mobile application for employee check-in and check-out.",
      "Implemented leave request management system.",
      "Created a QR code generator application for attendance tracking.",
      "Improved HR operational efficiency and record management.",
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
    name: "The Beast Gym Application",
    overview: "A mobile application designed for gym members to manage training sessions, book trainers, and purchase gym packages.",
    highlights: [
      "Implemented trainer booking system.",
      "Added package purchasing functionality.",
      "Built attendance check-in and check-out system.",
      "Enhanced customer engagement through mobile convenience.",
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
    name: "Sanpya Express eCommerce Platform",
    overview:
        "A comprehensive eCommerce system designed to support both online and in-store shopping operations with multiple applications for different user roles.",
    highlights: [
      "Developed mobile applications for customers, sales staff, and cashiers.",
      "Designed admin management system for operational control.",
      "Improved inventory management and transaction workflows.",
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
