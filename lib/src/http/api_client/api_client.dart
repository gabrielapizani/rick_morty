import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  factory ApiClient() {
    return _instance;
  }

  static final BaseOptions options = BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api',
  );

  static final Dio _dio = Dio(options);

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (e) {
      throw getErrorMessage(e);
    }
  }

  static const defaultErrorMessage =
      'Estamos sofrendo uma instabilidade ou seu sinal de internet está fraco. Por favor tente novamente mais tarde.';

  static String getErrorMessage(DioError error) {
    String errorDescription = defaultErrorMessage;

    if (error.response != null) {
      errorDescription = error.response?.data ?? defaultErrorMessage;
    }

    return errorDescription;
  }
}
