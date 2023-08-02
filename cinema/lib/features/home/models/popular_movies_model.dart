import 'package:cinema/features/home/models/movie_model.dart';

final oldObject = PopularMoviesModel(results: []);

class PopularMoviesModel {
  final List<MovieModel> results;

  PopularMoviesModel({required this.results});

  factory PopularMoviesModel.fromMap(Map<String, dynamic> data) {
    final List<dynamic> moviesList = data['results'];

    final movies = List<MovieModel>.generate(
      moviesList.length,
      (index) {
        return MovieModel.fromMap(moviesList[index]);
      },
    );

    return PopularMoviesModel(
      results: movies,
    );
  }

}
