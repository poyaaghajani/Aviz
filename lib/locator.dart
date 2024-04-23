import 'package:aviz/core/network/dio_provider.dart';
import 'package:aviz/features/feat_home/data/datasource/home_datasource.dart';
import 'package:aviz/features/feat_home/data/repository/home_repository.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getInit() async {
  /// component
  locator.registerSingleton<Dio>(DioProvider.dio);

  /// datasource
  locator.registerSingleton<HomeDatasource>(HomeDatasourceImpl(locator()));

  /// repository
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));

  /// bloc
  locator.registerSingleton<ManageHomeBloc>(ManageHomeBloc(locator()));
}
