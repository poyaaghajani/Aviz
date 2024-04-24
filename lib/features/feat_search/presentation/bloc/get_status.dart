import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchGetStatus extends Equatable {}

class SearchGetLoading extends SearchGetStatus {
  @override
  List<Object?> get props => [];
}

class SearchGetSuccess extends SearchGetStatus {
  final AdvertsModel response;
  SearchGetSuccess({required this.response});

  @override
  List<Object?> get props => [response];
}

class SearchGetError extends SearchGetStatus {
  final String errorMsg;
  SearchGetError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
