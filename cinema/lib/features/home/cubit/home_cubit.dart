import 'package:bloc/bloc.dart';
import 'package:cinema/features/home/models/popular_movies_model.dart';
import 'package:cinema/features/home/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());

  final HomeRepo _homeRepo;

  Future<void> getMovies() async {
    emit(HomeLoading());

    final popularMoviesModel = await _homeRepo.getMovies();

    emit(HomeSuccess(popularMoviesModel));
  }
}
