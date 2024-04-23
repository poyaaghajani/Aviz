import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeGetStatus extends Equatable {}

class HomeGetLoading extends HomeGetStatus {
  @override
  List<Object?> get props => [];
}

class HomeGetSuccess extends HomeGetStatus {
  final AdvertsModel allAdverts;
  final AdvertsModel hotAdverts;

  HomeGetSuccess({
    required this.allAdverts,
    required this.hotAdverts,
  });

  @override
  List<Object?> get props => [allAdverts, hotAdverts];
}

class HomeGetError extends HomeGetStatus {
  final String errorMsg;
  HomeGetError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
