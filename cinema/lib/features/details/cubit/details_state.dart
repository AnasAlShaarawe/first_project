import '../models/details_model.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoding extends DetailsState {}

class DetailsSuccess extends DetailsState {

  final DetailsModel popularDetailsModel;

  DetailsSuccess(this.popularDetailsModel);

}