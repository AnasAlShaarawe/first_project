import 'package:cinema/features/home/models/popular_movies_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Future<PopularMoviesModel> getMovies() async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/movie'));

    final response = await dio.get(
      '/popular',
      queryParameters: {
        'api_key': '70508c8754c1fa82850d9728db1287c6',
      },
    );

    return PopularMoviesModel.fromMap(response.data);
  }
}
