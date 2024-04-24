import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<AdvertsModel> getAllAdverts({required int page});
  Future<AdvertsModel> getHotAdverts({required int page});
}

class HomeDatasourceImpl extends HomeDatasource {
  final Dio dio;
  HomeDatasourceImpl(this.dio);

  @override
  Future<AdvertsModel> getAllAdverts({required int page}) async {
    try {
      var response = await dio.get(
        'collections/advert/records',
        queryParameters: {'page': page},
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

  @override
  Future<AdvertsModel> getHotAdverts({required int page}) async {
    try {
      var response = await dio.get(
        'collections/advert/records',
        queryParameters: {'filter': 'isHot=true', 'page': page},
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
