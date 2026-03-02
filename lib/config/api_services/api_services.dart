import 'package:bookly/keys/api_key.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio; 

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint,String apiKey=apiKey}) async {
    var response = await _dio.get('$_baseUrl$endPoint&key=$apiKey');
    return response.data;
  }
}
