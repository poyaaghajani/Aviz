import 'package:aviz/core/network/dio_provider.dart';
import 'package:aviz/features/feat_home/data/datasource/home_datasource.dart';
import 'package:aviz/features/feat_home/data/repository/home_repository.dart';
import 'package:aviz/features/feat_home/presentation/bloc/manage_home_bloc.dart';
import 'package:aviz/features/feat_search/data/datasource/search_datasource.dart';
import 'package:aviz/features/feat_search/data/repository/search_repository.dart';
import 'package:aviz/features/feat_search/presentation/bloc/manage_search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> getInit() async {
  /// component
  locator.registerSingleton<Dio>(DioProvider.dio);

  /// datasource
  locator.registerSingleton<HomeDatasource>(HomeDatasourceImpl(locator()));
  locator.registerSingleton<SearchDatasource>(SearchDatasourceImpl(locator()));

  /// repository
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<SearchRepository>(SearchRepositoryImpl(locator()));

  /// bloc
  locator.registerSingleton<ManageHomeBloc>(ManageHomeBloc(locator()));
  locator.registerSingleton<ManageSearchBloc>(ManageSearchBloc(locator()));
}
