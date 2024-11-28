import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<Response> post(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    var response = await dio.post(endPoint,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }

  Future<Response> get(String endPoint, {String? token}) async {
    try {
      var response = await dio.get(
        endPoint,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> delete(String endPoint, Map<String, dynamic> data,
      {String? token}) async {
    var response = await dio.delete(endPoint,
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }));
    return response;
  }
}
