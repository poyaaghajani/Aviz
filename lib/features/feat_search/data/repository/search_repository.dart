import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:aviz/features/feat_search/data/datasource/search_datasource.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<String, AdvertsModel>> getAdverts(
      {required String query, required int page});
}

class SearchRepositoryImpl extends SearchRepository {
  final SearchDatasource datasource;
  SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<String, AdvertsModel>> getAdverts(
      {required String query, required int page}) async {
    try {
      final response = await datasource.getAdverts(query: query, page: page);
      return right(response);
    } on AppException catch (ex) {
      return left(appExcenptionHandler(ex.message!));
    }
  }
}
