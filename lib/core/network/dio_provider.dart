import 'package:aviz/core/constants/app_strings.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  DioProvider._();

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: AppStrings.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    ),
  );
}
