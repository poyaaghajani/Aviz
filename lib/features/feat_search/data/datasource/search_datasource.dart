import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:dio/dio.dart';

abstract class SearchDatasource {
  Future<AdvertsModel> getAdverts({required String query, required int page});
}

class SearchDatasourceImpl extends SearchDatasource {
  final Dio dio;
  SearchDatasourceImpl(this.dio);

  @override
  Future<AdvertsModel> getAdverts({
    required String query,
    required int page,
  }) async {
    try {
      var response = await dio.get(
        'collections/advert/records',
        queryParameters: {
          'filter': "title ~ '$query'",
          'page': page,
        },
      );
      return AdvertsModel.fromJson(response.data);
    } on DioException catch (ex) {
      throw AppException(
        message: '',
        dioException: ex,
      );
    } catch (_) {
      throw AppException(message: 'error');
    }
  }
}
