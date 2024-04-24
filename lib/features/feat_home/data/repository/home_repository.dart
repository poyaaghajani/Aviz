import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/datasource/home_datasource.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<String, AdvertsModel>> getAllAdverts({required int page});
  Future<Either<String, AdvertsModel>> getHotAdverts({required int page});
}

class HomeRepositoryImpl extends HomeRepository {
  final HomeDatasource datasource;
  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<String, AdvertsModel>> getAllAdverts(
      {required int page}) async {
    try {
      final response = await datasource.getAllAdverts(page: page);
      return right(response);
    } on AppException catch (ex) {
      return left(appExcenptionHandler(ex.message!));
    }
  }

  @override
  Future<Either<String, AdvertsModel>> getHotAdverts(
      {required int page}) async {
    try {
      final response = await datasource.getHotAdverts(page: page);
      return right(response);
    } on AppException catch (ex) {
      return left(appExcenptionHandler(ex.message!));
    }
  }
}
