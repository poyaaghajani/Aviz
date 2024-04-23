import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/datasource/home_datasource.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String, AdvertsModel>> getAllAdverts();
  Future<Either<String, AdvertsModel>> getHotAdverts();
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource datasource;
  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<String, AdvertsModel>> getAllAdverts() async {
    try {
      final response = await datasource.getAllAdverts();
      return right(response);
    } on AppException catch (ex) {
      return left(appExcenptionHandler(ex.message!));
    }
  }

  @override
  Future<Either<String, AdvertsModel>> getHotAdverts() async {
    try {
      final response = await datasource.getHotAdverts();
      return right(response);
    } on AppException catch (ex) {
      return left(appExcenptionHandler(ex.message!));
    }
  }
}
