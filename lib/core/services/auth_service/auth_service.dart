import 'package:dio/dio.dart';
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio;

  AuthService() : _dio = Dio();

  Future<String> login({
    required String username,
    required String password,
  }) async {
    final response = await _dio.post(
      'https://demo.smarttrack.live/web/session/authenticate',
      data: {
        "params": {
          "db": "smart_track",
          "login": username,
          "password": password,
        }
      },
    );

    final result = response.data;
    if (result == null ) {
      throw Exception("Invalid login response.");
    }
return result;
//further steps pending
// haven't got any success response to validate
}
}
