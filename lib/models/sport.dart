class Sport {
  Sport({required this.name, required this.description});

  factory Sport.fromJson(Map<String, dynamic> json) {
    return Sport(
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
  final String name;
  final String description;
}
