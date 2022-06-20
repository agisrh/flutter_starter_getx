import 'package:dio/dio.dart';
import '../config/env.dart';
import '../helpers/api_base_helper.dart';

class ExampleService extends ApiBaseHelper {
  final _baseUrl = Env.baseURL;
  ApiBaseHelper api = ApiBaseHelper();

  // Sign in
  Future<dynamic> signIn({
    required String email,
    required String password,
  }) async {
    final response = await api.postHTTP(
      _baseUrl + '/auth/login',
      FormData.fromMap({'email': email, 'password': password}),
    );
    return response;
  }
}
