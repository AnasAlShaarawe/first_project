class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String image;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.image,
  });

  factory MovieModel.fromMap(Map<String, dynamic> data) {
    return MovieModel(
      id: data['id'],
      title: data['original_title'],
      overview: data['overview'],
      image: data['poster_path'],
    );
  }
}
