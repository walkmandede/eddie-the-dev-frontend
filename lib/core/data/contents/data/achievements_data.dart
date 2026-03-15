import 'package:eddie_the_dev_frontend/core/data/contents/models/achievement.dart';

final List<Achievement> achievementsData = [
  Achievement(
    name: 'Bachelor of Science in Computer Science',
    issuer: 'University of Sunderland',
    issuedDate: DateTime(2025, 3),
    credentialUrl: '',
    imageUrl: 'https://res.cloudinary.com/dgajyuay4/image/upload/v1773573477/1757722750917_fhzyfv.jpg',
    newSkills: [
      'Project Management — understanding the Software Development Life Cycle (SDLC), project planning, milestone tracking, and delivery management.',
    ],
    improvedSkills: [
      'Database Management — working with PostgreSQL and MongoDB, including database design, normalization, indexing strategies, and query optimization.',
      'Android Development (Java) — building Android applications using Java, implementing UI components, managing activities/fragments, and handling data persistence.',
    ],
  ),
  Achievement(
    name: "Advanced Flutter: Build Enterprise-Ready Apps",
    issuer: "Udemy",
    issuedDate: DateTime(2025, 8),
    credentialUrl: "https://www.udemy.com/certificate/UC-8df60fe8-cOb4-4cc7-a7c8-4ce9e59c1b37/",
    imageUrl: 'https://res.cloudinary.com/dgajyuay4/image/upload/v1773573477/1755619056275_pmjqle.jpg',
    newSkills: [
      'Riverpod - clearer and more scalable state management',
      'Flutter Hooks - simplifying widget lifecycles',
      'Mason Bricks - faster project scaffolding with templates',
      'CI/CD with Codemagic - automating builds & deployments',
    ],
    improvedSkills: [
      'Clean Architecture - previously I use layer-first only, now I know when and how to apply feature-first',
      'Debouncing & Throttling - now with a more optimized approach',
      'GoRouter - moved beyond simple routing to redirects, shell routes & auth guards',
      'Versioning - better workflow for releases',
      'Flavor Management - learned the proper way to set up flavors in Flutter',
      'Error Handling - from manual handling to a reusable, structured approach',
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
      'Type Script',
      'Postgresql',
      'Socket.io',
      'RESTful API',
    ],
  ),
];
