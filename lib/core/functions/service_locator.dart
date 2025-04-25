import 'package:bookly_app_clean_arc/core/api/api_service.dart';
import 'package:bookly_app_clean_arc/features/home/data/data_sources/local/home_local_data_source_impl.dart';
import 'package:bookly_app_clean_arc/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:bookly_app_clean_arc/features/home/data/repositories/home_repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImple(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
