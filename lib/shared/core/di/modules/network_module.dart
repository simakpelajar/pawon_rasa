import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/shared/core/infrastructure/network/config_provider.dart';
import 'package:pawon_rasa/shared/core/infrastructure/network/dio_provider.dart';

void registerNetworkDependencies(GetIt getIt) {
  // Register Config
  getIt.registerLazySingleton<Map<String, String>>(() => ConfigProvider.config);

  // Register Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.create());
}
