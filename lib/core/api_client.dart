import 'package:dio/dio.dart';

abstract class ApiClient {
  // late final Dio _dio;
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8080/api/movies',
        headers: {'Accept': 'application/json'},
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  // Dio get dio => _dio;
}
