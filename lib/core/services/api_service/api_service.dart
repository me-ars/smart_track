import 'package:dio/dio.dart';

class DioService {
  final Dio _dio;

  DioService({BaseOptions? options})
      : _dio = Dio(options ??
      BaseOptions(
        baseUrl: 'https://demo.smarttrack.live',

        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ));

  /// POST method for reuse
  Future<Response> post(String path, {Map<String, dynamic>? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return "Bad response: ${error.response?.statusCode} ${error.response?.statusMessage}";
      case DioExceptionType.cancel:
        return "Request cancelled";
      case DioExceptionType.unknown:
      default:
        return "Unexpected error: ${error.message}";
    }
  }
}
