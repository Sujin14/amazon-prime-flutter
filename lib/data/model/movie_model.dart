class Movie {
  final int id;
  final String image;
  final String name;
  final String language;
  final String description;
  final String genre;
  final String releaseYear;

  Movie({
    required this.id,
    required this.image,
    required this.name,
    required this.language,
    required this.description,
    required this.genre,
    required this.releaseYear,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      language: json['language'] ?? '',
      description: json['description'] ?? '',
      genre: json['genre'] ?? '',
      releaseYear: json['releaseYear']?.toString() ?? 0.toString(),
    );
  }
}
