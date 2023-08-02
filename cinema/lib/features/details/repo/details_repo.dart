import 'package:dio/dio.dart';


import '../models/details_model.dart';

class DetailsRepo {
  Future<DetailsModel> getMovieDetails(int movieId) async {
    final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/movie'));

    final response = await dio.get(
      '/$movieId',
      queryParameters: {
        'api_key': '70508c8754c1fa82850d9728db1287c6',
      },
    );

    return DetailsModel.fromMap(response.data);
  }
}