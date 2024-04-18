class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;

  const Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(Map<String, dynamic> data) => Source(
        id: data['id'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        url: data['url'] as String?,
        category: data['category'] as String?,
        language: data['language'] as String?,
        country: data['country'] as String?,
      );
}
