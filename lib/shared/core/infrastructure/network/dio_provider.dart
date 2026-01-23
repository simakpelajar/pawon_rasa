import 'package:dio/dio.dart';
import 'package:pawon_rasa/shared/core/infrastructure/network/api_client.dart';
import 'package:pawon_rasa/shared/core/infrastructure/network/config_provider.dart';

class DioFactory {
  static Dio create() {
    final env = ConfigProvider.config;
    final baseUrl = env['baseUrl']!;

    final dio = ApiClient.build(baseUrl: baseUrl, token: null);

    // if (kDebugMode) {
    //   dio.interceptors.add(
    //     PrettyDioLogger(
    //       requestHeader: true,
    //       requestBody: true,
    //       responseBody: true,
    //       responseHeader: false,
    //       error: true,
    //       compact: true,
    //       maxWidth: 90,
    //     ),
    //   );
    // }

    return dio;
  }
}
