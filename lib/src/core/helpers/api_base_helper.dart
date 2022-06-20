import 'package:dio/dio.dart';
import '../config/env.dart';
import 'exceptions.dart';
import 'package:get_storage/get_storage.dart';

class ApiBaseHelper extends Env {
  // Base Option
  static BaseOptions opts = BaseOptions(
    baseUrl: Env.baseURL,
    responseType: ResponseType.json,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  // Handle Message Error
  Object _handleMessage(int? statusCode, String message) {
    Object _data = {
      "success": false,
      "status": statusCode,
      "message": message,
    };

    return _data;
  }

  // Create Dio
  static Dio createDio() {
    return Dio(opts);
  }

  // Add Interceptor
  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(onRequest: (options, handler) {
          requestInterceptor(options);
          return handler.next(options);
        }, onError: (e, handler) async {
          return handler.next(e);
        }),
      );
  }

  // Request  Interceptor
  static dynamic requestInterceptor(RequestOptions options) async {
    GetStorage box = GetStorage(Env.keyApps);
    final token = box.read('TOKEN'); // get token
    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  // Method GET
  Future<dynamic> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return _handleMessage(e.response?.statusCode, errorMessage);
    }
  }

  // Method POST
  Future<dynamic> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response.data;
    } on DioError catch (e) {
      // Handle Error
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return _handleMessage(e.response?.statusCode, errorMessage);
    }
  }

  // Method PUT
  Future<dynamic> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response.data;
    } on DioError catch (e) {
      // Handle Error
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return _handleMessage(e.response?.statusCode, errorMessage);
    }
  }

  // Method DELETE
  Future<dynamic> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response.data;
    } on DioError catch (e) {
      // Handle Error
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return _handleMessage(e.response?.statusCode, errorMessage);
    }
  }
}


// EXAMPLE FOR USE
// ApiBaseHelper api = ApiBaseHelper();
// Response res = api.getHTTP('url');