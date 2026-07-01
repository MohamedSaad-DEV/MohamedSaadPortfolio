class EducationModel {
  const EducationModel({
    required this.degree,
    required this.institution,
    required this.period,
    required this.grade,
    required this.role,
    required this.projectTitle,
    required this.projectGrade,
    required this.projectDetails,
    required this.projectTechnologies,
    required this.achievement,
  });

  final String degree;
  final String institution;
  final String period;
  final String grade;
  final String role;
  final String projectTitle;
  final String projectGrade;
  final List<String> projectDetails;
  final List<String> projectTechnologies;
  final String achievement;
}
