part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final PopularMoviesModel popularMoviesModel;

  HomeSuccess(this.popularMoviesModel);
}
