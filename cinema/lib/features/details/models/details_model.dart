class DetailsModel {
  final int id;
  final String title;
  final String overview;
  final String image;
  final double vote;
  final List<String> genres;



  DetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.image,
    required this.vote ,
    required this.genres,

  });

  factory DetailsModel.fromMap(Map<String, dynamic> data){
    final List<dynamic> genresList = data['genres'];

    final details = List<String>.generate(
        genresList.length, (index) {
          final x = genresList[index];
          return x['name'];

    },
    );



    return DetailsModel(
      id: data['id'],
      title: data['original_title'],
      overview: data['overview'],
      image: data['poster_path'],
      vote: data['vote_average'],
      genres: details,
     // genres:  List<String> genres = data['results']
    );
  }
}