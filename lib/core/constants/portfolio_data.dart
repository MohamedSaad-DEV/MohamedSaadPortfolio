import '../../Features/portfolio/models/education_model.dart';
import '../../Features/portfolio/models/experience_model.dart';
import '../../Features/portfolio/models/project_model.dart';
import '../../Features/portfolio/models/skill_model.dart';
import 'assets_constants.dart';

abstract final class PortfolioData {
  static const String name = 'Mohamed Saad';
  static const String title = 'Senior Software Engineer';
  static const String subtitle = 'Flutter & Odoo Developer';
  static const String location = 'Cairo, Egypt';
  static const String phone = '01003256240';
  static const String email = 'mohamedsaad.cis@gmail.com';
  static const String linkedInUrl = 'https://www.linkedin.com/in/mohamed-saad-flutter';

  static const String summary =
      'Senior Flutter Developer with 5+ years of proven experience designing, developing, '
      'and deploying high-performance cross-platform mobile applications for Android, iOS, and Web. '
      'Expert in UI/UX implementation, state management (Bloc, Provider, GetX), responsive layouts, '
      'performance optimization, and multi-module app architecture. Strong command of OOP, SOLID principles, '
      'clean architecture, API integration (REST), and scalable project structure. '
      'Additionally experienced in Odoo Development (v14–v18).';

  static const List<String> typewriterPhrases = [
    'Senior Flutter Developer',
    'Cross-Platform Architect',
    'Clean Code Advocate',
    'Odoo Integration Expert',
    'Mobile Performance Engineer',
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Senior Flutter Developer',
      company: 'Expand360',
      location: 'Cairo, Egypt (Hybrid)',
      period: 'Jun 2026 – Present',
      highlights: [
        'Led end-to-end development of Belvro, a fintech investment platform built with Flutter.',
        'Engineered scalable mobile architecture using MVVM, modularization, and best engineering practices.',
        'Integrated Alpaca Trading API for brokerage connectivity, real-time market data, and portfolio management.',
        'Designed secure financial user flows: authentication, wallet funding, portfolio sync, and transactions.',
        'Established reusable networking, state management, DI, caching, logging, and error-handling frameworks.',
      ],
    ),
    ExperienceModel(
      role: 'Senior Flutter Developer',
      company: 'Techno Town',
      location: 'Cairo, Egypt (Remote)',
      period: 'July 2022 – Jun 2026',
      highlights: [
        'Designed scalable mobile architectures using Clean Architecture, MVVM, and modular design patterns.',
        'Integrated advanced mobile SDKs (Firebase, Google Play Services) and RESTful APIs.',
        'Delivered polished interfaces with advanced UI/UX, animations, localization (AR/EN), and responsive layouts.',
        'Developed payment gateways, booking systems, notifications, RBAC, chat, dashboards, and analytics.',
        'Applied Git, GitFlow, CI/CD pipelines (Fastlane, GitHub Actions) for automated app delivery.',
        'Odoo Development (v14–v18): custom modules, workflow automation, Flutter-Odoo API integrations.',
      ],
    ),
    ExperienceModel(
      role: 'Junior Flutter Developer',
      company: 'The Pyramid',
      location: 'Mansoura, Egypt (Hybrid)',
      period: 'Oct 2021 – Jun 2022',
      highlights: [
        'Built mobile applications from scratch for various business domains.',
        'Implemented improvements and user-requested features.',
        'Published apps on Google Play and Apple App Store.',
      ],
    ),
    ExperienceModel(
      role: 'Junior Flutter Developer',
      company: 'Gadara Company',
      location: 'Freelance',
      period: 'Jan 2021 – Jun 2021',
      highlights: [
        'Developed complete applications for clients.',
        'Handled updates, fixes, and feature enhancements.',
        'Deployed applications to Google Play.',
      ],
    ),
    ExperienceModel(
      role: 'Trainee – .NET Programming',
      company: 'Information Technology Institute (ITI)',
      location: 'Egypt',
      period: 'Jul 2019 – Aug 2019',
      highlights: [
        'Foundation training in .NET programming and software development fundamentals.',
      ],
    ),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      name: 'Techno Community',
      platforms: 'Android · iOS · Odoo',
      description:
          'Community management system for automated residential services with gate passes, voting, and payments.',
      contributions: [
        'Developed the entire system from scratch.',
        'Authentication & role-based access (Owner, Security, Facility Manager).',
        'AR/EN localization, feeds, votes, complaints, permits, gate pass QR.',
        'Invoices with Paymob, sub-user permissions.',
      ],
      playStorePackageId: 'technotown.technology.technocommunity',
      appStoreId: '6446179701',
      odooUrl: 'https://techno.community',
      technologies: ['Flutter', 'Odoo', 'Firebase', 'Paymob'],
    ),
    ProjectModel(
      name: 'Techno Clinic',
      platforms: 'Android · iOS · Odoo',
      description:
          'Medical system for health tracking, appointments, labs, pharmacies, and online consultations.',
      contributions: [
        'Created API integrations between Flutter app and Odoo backend.',
        'Medicine alarms, UI enhancements, wallet-based payments.',
        'Online consultation and appointment management.',
      ],
      playStorePackageId: 'technotown.technology.technoclinic',
      appStoreId: '1645532873',
      odooUrl: 'https://techno.clinic',
      technologies: ['Flutter', 'Odoo', 'REST API'],
    ),
    ProjectModel(
      name: 'Sofa Vet',
      platforms: 'Android · iOS',
      description:
          'Veterinary application for appointments, boarding, notifications, radiology, and e-commerce.',
      contributions: [
        'Authentication, home module, appointments, and booking.',
        'Radiology & lab features, vaccination reminders, notifications.',
        'E-commerce store and ads section.',
      ],
      playStorePackageId: 'technotown.technology.sofavet',
      appStoreId: '6462812216',
      technologies: ['Flutter', 'Firebase'],
    ),
    ProjectModel(
      name: 'Elle Salon',
      platforms: 'Android · iOS · Odoo',
      description:
          'Salon service and booking management platform with loyalty points and rewards.',
      contributions: [
        'Authentication, booking, notifications, surveys, vlogs.',
        'Loyalty Points & rewards feature.',
        'System enhancement on Odoo backend.',
      ],
      playStorePackageId: 'technotown.technology.ellesalon.elle_salon',
      appStoreId: '6472704459',
      odooUrl: 'https://elle.technotown.technology',
      technologies: ['Flutter', 'Odoo'],
    ),
    ProjectModel(
      name: 'Town Vet',
      platforms: 'Android · iOS · Odoo',
      description:
          'Multi-clinic veterinary platform for pet appointments, boarding, vaccination plans, and medical history.',
      contributions: [
        'Booking, boarding, notifications, lab/radiology/vaccination history.',
        'Pet management, invitations, loyalty points, and image uploads.',
        'Developed Flutter app and Odoo modules for multi-clinic support.',
      ],
      playStorePackageId: 'technotown.technology.town_vet',
      appStoreId: '6747810628',
      odooUrl: 'https://technotown.technology/products',
      logoAsset: AssetsConstants.townVetLogo,
      technologies: ['Flutter', 'Odoo'],
    ),
    ProjectModel(
      name: 'Mazekty',
      platforms: 'APK · GitHub',
      description: 'Personal Flutter music player with background playback and favorites.',
      contributions: [
        'Background playback, albums/artists browsing.',
        'Favorites, repeat modes, next/previous track controls.',
      ],
      githubUrl: 'https://github.com/mohamedsaad/mazekty',
      technologies: ['Flutter', 'Dart'],
    ),
    ProjectModel(
      name: 'Daweer',
      platforms: 'Android · iOS',
      description: 'Marketplace application for cars and real estate listings.',
      contributions: [
        'Supported main app features and developed enhancements.',
        'Listings and publishing workflow improvements.',
      ],
      technologies: ['Flutter', 'REST API'],
    ),
  ];

  static const List<ProjectModel> inProgressProjects = [
    ProjectModel(
      name: 'Belvro',
      platforms: 'Android · iOS · Web',
      description:
          'Fintech investment platform with Alpaca brokerage integration, real-time market data, and portfolio management.',
      contributions: [
        'Led end-to-end Flutter development from architecture design through deployment.',
        'Integrated Alpaca Trading API for brokerage, market data, and trading workflows.',
        'Built secure flows: auth, wallet funding, portfolio sync, and transactions.',
        'Engineered MVVM architecture with modularization, DI, caching, and CI/CD.',
      ],
      logoAsset: AssetsConstants.belvroLogo,
      isInProgress: true,
      technologies: ['Flutter', 'Alpaca API', 'Bloc', 'MVVM', 'Stripe', 'Firebase'],
    ),
    ProjectModel(
      name: 'GYM Management System',
      platforms: 'Odoo Backend · Flutter Mobile (Not Started)',
      description:
          'End-to-end gym management platform for memberships, subscriptions, attendance, and staff workflows.',
      contributions: [
        'Building Odoo backend modules for members, plans, subscriptions, and billing.',
        'Designing REST APIs and business workflows for gym operations and reporting.',
        'Flutter mobile app planned for member check-in, bookings, and notifications.',
      ],
      isInProgress: true,
      technologies: ['Odoo', 'Python', 'REST API', 'Flutter'],
    ),
  ];

  static const EducationModel education = EducationModel(
    degree: 'Bachelor of Computer Science',
    institution: 'Mansoura University',
    period: '2016 – 2020',
    grade: 'Very Good',
    role: 'Team Leader',
    projectTitle: 'Online Recruitment System Using AI',
    projectGrade: 'Excellent (199/200)',
    projectDetails: [
      'Job recommendation engine using content-based filtering.',
      'Chatbot for CV generation.',
      'Designed complete mobile UI.',
    ],
    projectTechnologies: ['Python', 'Dialogflow', 'Firebase', 'Flutter', 'Dart', 'Flask'],
    achievement: 'Second place for Graduation Project at ITDS-4.',
  );

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Programming Languages',
      skills: ['Dart (5+ years)', 'JavaScript', 'Python', 'HTML'],
    ),
    SkillCategory(
      title: 'Frameworks & Tools',
      skills: ['Flutter (5 years) – 10+ apps', 'Odoo (2 years) – 3+ systems', 'GitHub'],
    ),
    SkillCategory(
      title: 'Development Skills',
      skills: [
        'OOP & SOLID Principles',
        'Clean Architecture',
        'MVC / MVVM',
        'Bloc · Provider · GetX',
        'Firebase · SQLite · APIs · Google Maps',
        'Play Store & App Store deployment',
        'Responsive UI & Cross-platform',
        'Paymob integration',
      ],
    ),
    SkillCategory(
      title: 'Languages',
      skills: ['Arabic: Native', 'English: Professional Working Proficiency'],
    ),
  ];

  static const List<String> techBackgroundIcons = [
    'Flutter',
    'Dart',
    'Firebase',
    'Odoo',
    'Bloc',
    'Git',
    'REST',
    'CI/CD',
    'Android',
    'iOS',
    'Python',
    'GetX',
  ];
}
