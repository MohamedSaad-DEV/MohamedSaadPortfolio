class ProjectModel {
  const ProjectModel({
    required this.name,
    required this.platforms,
    required this.description,
    required this.contributions,
    required this.technologies,
    this.playStorePackageId,
    this.appStoreId,
    this.odooUrl,
    this.githubUrl,
    this.logoAsset,
    this.isInProgress = false,
  });

  final String name;
  final String platforms;
  final String description;
  final List<String> contributions;
  final List<String> technologies;
  final String? playStorePackageId;
  final String? appStoreId;
  final String? odooUrl;
  final String? githubUrl;
  final String? logoAsset;
  final bool isInProgress;

  String? get playStoreUrl => playStorePackageId != null
      ? 'https://play.google.com/store/apps/details?id=$playStorePackageId'
      : null;

  String? get appStoreUrl =>
      appStoreId != null ? 'https://apps.apple.com/app/id$appStoreId' : null;
}
