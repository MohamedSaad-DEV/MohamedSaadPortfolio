class ExperienceModel {
  const ExperienceModel({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.highlights,
  });

  final String role;
  final String company;
  final String location;
  final String period;
  final List<String> highlights;
}
