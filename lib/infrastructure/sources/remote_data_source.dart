import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio _dio = Dio();

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> get(String path) async {
    return await _dio.get(path);
  }
}
