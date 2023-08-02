import 'package:bloc/bloc.dart';

import '../repo/details_repo.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {

  DetailsCubit(this._detailsRepo) : super(DetailsInitial());

  final DetailsRepo _detailsRepo;

  Future<void> getMovieDetails(int movieId) async {
    emit(DetailsLoding());

    final popularDetailsModel = await _detailsRepo.getMovieDetails(movieId);

        emit(DetailsSuccess(popularDetailsModel));
  }
}