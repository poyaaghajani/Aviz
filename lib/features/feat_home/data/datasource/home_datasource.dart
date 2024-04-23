import 'package:aviz/core/network/app_exeption.dart';
import 'package:aviz/features/feat_home/data/models/advert_model.dart';
import 'package:dio/dio.dart';

abstract class HomeDatasource {
  Future<AdvertsModel> getAllAdverts();
  Future<AdvertsModel> getHotAdverts();
}

class HomeDatasourceImpl extends HomeDatasource {
  final Dio dio;
  HomeDatasourceImpl(this.dio);

  @override
  Future<AdvertsModel> getAllAdverts() async {
    try {
      var response = await dio.get('collections/advert/records');
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
  Future<AdvertsModel> getHotAdverts() async {
    try {
      var response = await dio.get(
        'collections/advert/records',
        queryParameters: {'filter': 'isHot=true'},
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
